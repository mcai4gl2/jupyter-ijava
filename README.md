Jupyter IJava
=============

[IJava](https://github.com/SpencerPark/IJava) is an excellent project to get java running within jupyter.

A java interactive shell is quite useful when:
- Exploring coding ideas
- Showing how some code works

Even though IJava project hasn't been updated for a while. I have tested it with `java 17` and it is working fine.

I decided to build this docker image so I can use IJava in the same jupyter instance as the python notebooks I am running.

The image is based on `jupyter/base-notebook`. Java 17 is installed on top with IJava 1.3.0, to allow java kernel to be created in jupyter.

e.g.:
![IJava Example](ijava.png)
