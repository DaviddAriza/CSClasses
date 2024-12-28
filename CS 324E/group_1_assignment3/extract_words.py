#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Created on Sat Sep 21 14:04:39 2024

@author: colecarlile
"""

import re
from collections import defaultdict

# Function to extract words
def extract_words_from_file(filename):
    with open(filename, 'r', encoding='utf-8') as file:
        text = file.read().lower()  # Convert to lowercase
        words = re.findall(r'[a-z]+', text)  # Extract words using regex library
    return words

# Function to write all words to allwords.txt
def write_allwords(words, output_file):
    with open(output_file, 'w', encoding='utf-8') as file:
        for word in words:
            file.write(word + '\n')

# Function to write unique words to uniquewords.txt
def write_uniquewords(words, output_file):
    word_count = defaultdict(int)
    
    # Count occurrences of each word
    for word in words:
        word_count[word] += 1
    
    # Write unique words to file
    with open(output_file, 'w', encoding='utf-8') as file:
        for word, count in word_count.items():
            if count == 1:
                file.write(word + '\n')

# Function to write word frequency to wordfrequency.txt
def write_wordfrequency(words, output_file):
    word_count = defaultdict(int)
    frequency_count = defaultdict(int)
    
    # Count occurrences of each word
    for word in words:
        word_count[word] += 1
    
    # Count how many words have each frequency
    for count in word_count.values():
        frequency_count[count] += 1
    
    # Write frequency data to file, sorted by frequency
    with open(output_file, 'w', encoding='utf-8') as file:
        for freq in sorted(frequency_count.keys()):
            file.write(f'{freq}: {frequency_count[freq]}\n')

def main():
    
    input_file = 'novel.txt'
    
    # Extract words
    words = extract_words_from_file(input_file)
    
    # Write all words to allwords.txt
    write_allwords(words, 'allwords.txt')
    
    # Write unique words to uniquewords.txt
    write_uniquewords(words, 'uniquewords.txt')
    
    # Write word frequency to wordfrequency.txt
    write_wordfrequency(words, 'wordfrequency.txt')

if __name__ == '__main__':
    main()
