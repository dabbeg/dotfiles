import httplib2
import os

from apiclient import discovery
import oauth2client
from oauth2client import client
from oauth2client import tools
from apiclient import errors
import subprocess

try:
    import argparse
    flags = argparse.ArgumentParser(parents=[tools.argparser]).parse_args()
except ImportError:
    flags = None

SCOPES = 'https://www.googleapis.com/auth/gmail.readonly'
CLIENT_SECRET_FILE = 'client_secret.json'
APPLICATION_NAME = 'Gmail API Quickstart'
MONTHS = {'Jan': 1, 'Feb': 2, 'Mar': 3, 'Apr': 4, 'May': 5, 'Jun': 6, 'Jul': 7, 'Aug': 8, 'Sep': 9, 'Oct': 10, 'Nov': 11, 'Dec': 12}


def get_credentials():
    """Gets valid user credentials from storage.

    If nothing has been stored, or if the stored credentials are invalid,
    the OAuth2 flow is completed to obtain the new credentials.

    Returns:
        Credentials, the obtained credential.
    """
    home_dir = os.path.expanduser('~')
    credential_dir = os.path.join(home_dir, '.credentials')
    if not os.path.exists(credential_dir):
        os.makedirs(credential_dir)
    credential_path = os.path.join(credential_dir,
                                   'gmail-quickstart.json')

    store = oauth2client.file.Storage(credential_path)
    credentials = store.get()
    if not credentials or credentials.invalid:
        flow = client.flow_from_clientsecrets(CLIENT_SECRET_FILE, SCOPES)
        flow.user_agent = APPLICATION_NAME
        if flags:
            credentials = tools.run_flow(flow, store, flags)
        else: # Needed only for compatability with Python 2.6
            credentials = tools.run(flow, store)
        print('Storing credentials to ' + credential_path)
    return credentials

def ListMessagesWithLabels(service, user_id, label_ids=[]):
  """List all Messages of the user's mailbox with label_ids applied.

  Args:
    service: Authorized Gmail API service instance.
    user_id: User's email address. The special value "me"
    can be used to indicate the authenticated user.
    label_ids: Only return Messages with these labelIds applied.

  Returns:
    List of Messages that have all required Labels applied. Note that the
    returned list contains Message IDs, you must use get with the
    appropriate id to get the details of a Message.
  """
  try:
    response = service.users().messages().list(userId=user_id,
                                               labelIds=label_ids).execute()
    messages = []
    if 'messages' in response:
      messages.extend(response['messages'])

    while 'nextPageToken' in response:
      page_token = response['nextPageToken']
      response = service.users().messages().list(userId=user_id,
                                                 labelIds=label_ids,
                                                 pageToken=page_token).execute()
      messages.extend(response['messages'])

    return messages
  except errors.HttpError:
    print('An error occurred: %s')


def GetMessage(service, user_id, msg_id):
  """Get a Message with given ID.

  Args:
    service: Authorized Gmail API service instance.
    user_id: User's email address. The special value "me"
    can be used to indicate the authenticated user.
    msg_id: The ID of the Message required.

  Returns:
    A Message.
  """
  try:
    message = service.users().messages().get(userId=user_id, id=msg_id).execute()

    print('Message snippet: %s' % message['snippet'])

    return message
  except errors.HttpError:
    print('An error occurred')

def checkForNewMessages(service, lis):
    counter = 0
    for msg in lis:
        counter += 1
        if counter == 4: break
        header = GetMessage(service, 'me', msg['id'])['payload']['headers']

        #Wed, 19 Aug 2015 20:58:19 +0000
        date = []
        for x in header:
            if x['name'] == 'Date':
                date = x['value'].split()

        time = date[4].split(':')

        msgYear = int(date[3])
        msgMonth = MONTHS[date[2]]
        msgDay = int(date[1])
        msgHour = int(time[0])
        msgMin = int(time[1])
        msgSec = int(time[2])

        dateNow = subprocess.check_output(('date', '+%Y %m %d %H %M %S'))
        dateNow = dateNow.decode("utf-8")
        dateNow = dateNow.split()

        year = int(dateNow[0])
        month = int(dateNow[1])
        day = int(dateNow[2])
        hour = int(dateNow[3])
        minu = int(dateNow[4])
        sec = int(dateNow[5])

        if msgYear == year:
            print("same year")
            if msgMonth == month:
                print("same month")
                if msgDay == day:
                    print("same day")
                    if msgHour == hour:
                        print("same hour")
                        if msgMin == minu:
                            print("valid message")
                        elif msgMin+1 == minu:
                            if msgSec < sec:
                                print("valid message")




def main():
    credentials = get_credentials()
    http = credentials.authorize(httplib2.Http())
    service = discovery.build('gmail', 'v1', http=http)

    results = service.users().labels().list(userId='me').execute()
    labels = results.get('labels', [])

    if not labels:
        print('No labels found.')
    else:
      print('Labels:')
      for label in labels:
        print(label['name'])

    personal = ListMessagesWithLabels(service, 'me', ['INBOX'])
    #personal = ListMessagesWithLabels(service, 'me', ['INBOX', 'CATEGORY_PERSONAL'])
    #updates = ListMessagesWithLabels(service, 'me', ['INBOX', 'CATEGORY_UPDATES'])

    checkForNewMessages(service, personal)
    #checkForNewMessages(service, updates)


if __name__ == '__main__':
    main()
