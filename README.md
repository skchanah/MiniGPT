# Mini_GPT

Adopted from CS224N Assignment 5, Stanford University 

This GPT-like model is highly simplified and aimed to predict the birthplace of a target based on a given corpus.

[There are five .py files in the model folder:]

.MiniGPT: helper module, call all classes
.model: the GPT-1 class
.helper: an organizer class for methods to run training, pretraining and finetuning to update GPT from .model
.dataset: Class for methods to prepare normal or span-corrupted training datasets
.attention: Classes for two multi-head self-attention methods (vanila and synthesizers)
.trainer: Classes for training method
.utils: Classes for predictions and evaluations methods

