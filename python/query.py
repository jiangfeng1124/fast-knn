#!/bin/python

from optparse import OptionParser
from time import clock
import sys

if __name__ == '__main__':
    """
    Find out k-nearest words for all words in vocabulary
    """

    parser = OptionParser()
    parser.add_option("-e", "--embeddings", 
            dest = "embeddings",
            help = "filename of your word embeddings")
    parser.add_option("-k", "--k-nearest", 
            dest = "k", type="int", default=10,
            help = "k nearest words you want")

    (options, args) = parser.parse_args()

    if options.embeddings is None:
        parser.print_help()
        exit(1)

    word_map = []
    embedding = []
    for line in open(options.embeddings):
        line = line.strip().split()
        word_map.append(line[0])
        embedding.append(tuple([float(v) for v in line[1:]]))

    import numpy
    from scipy import spatial

    print >> sys.stderr, "... building KD Tree"
    tree = spatial.KDTree(embedding)
    print >> sys.stderr, "... Done build KD Tree"

    distances, indexes = tree.query(embedding, k=options.k+1)
    for i,w in enumerate(word_map):
        print "%s :" % w,
        print " ".join([word_map[j] for j in list(indexes[i])[1:]])

