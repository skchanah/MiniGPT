# Mini_GPT

Adopted from Assignment from course CS224N, Stanford University 

This GPT-1-like model is highly simplified and designed to predict the origin of a target based on a given corpus. (Pre-)Training objectives of current GPT models, except random deletion, are dropped to compact the training.

## Main Directory

***environment.yml / .environment_gpu.yml***: Environments for cpu and gpu

***run.py / run.sh***: .py and .sh runfiles

## Model folder

***.MiniGPT***: helper module, call all classes

***.model***: the GPT-1 class

***.helper***: an organizer class for methods to run training, pretraining and finetuning to update GPT from .model

***.dataset***: Class for methods to prepare normal or span-corrupted training datasets

***.attention***: Classes for two multi-head self-attention methods (vanila and synthesizers)

***.trainer***: Classes for training method

***.utils***: Classes for predictions and evaluations methods


