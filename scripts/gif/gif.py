#!/bin/python3
import argparse

if __name__ == '__main__':
    initial_parser = argparse.ArgumentParser()
    initial_parser.add_argument(
        '-t', '--time',
        help=('How long do you want the gif to be')
    )
