#!/bin/bash

if [ "$1" = "vanilla_finetune_without_pretrain" ]; then
	python3 run.py --function=finetune --variant=vanilla --pretrain_corpus_path=./data/wiki.txt --writing_params_path=./Model/vanilla.model.params --finetune_corpus_path=./data/birth_places_train.tsv
elif [ "$1" = "vanilla_eval_dev_without_pretrain" ]; then
	if [ -f ./Model/vanilla.model.params ]; then
    	python3 run.py --function=evaluate --variant=vanilla --pretrain_corpus_path=./data/wiki.txt --reading_params_path=./Model/vanilla.model.params --eval_corpus_path=./data/birth_dev.tsv --outputs_path=./Model/vanilla.nopretrain.dev.predictions
	else
		echo "'./Model/vanilla.model.params' does not exist. Please run './run.sh vanilla_finetune_without_pretrain' on the VM to create this file."
	fi
elif [ "$1" = "vanilla_eval_test_without_pretrain" ]; then
	if [ -f ./Model/vanilla.model.params ]; then
		python3 run.py --function=evaluate --variant=vanilla --pretrain_corpus_path=./data/wiki.txt --reading_params_path=./Model/vanilla.model.params --eval_corpus_path=./data/birth_test_inputs.tsv --outputs_path=./Model/vanilla.nopretrain.test.predictions
	else
		echo "'./Model/vanilla.model.params' does not exist. Please run './run.sh vanilla_finetune_without_pretrain' on the VM to create this file."
	fi
elif [ "$1" = "vanilla_pretrain" ]; then
	echo "Starting Vanilla Pretrain: ~ 2 Hours"
    python3 run.py --function=pretrain --variant=vanilla --pretrain_corpus_path=./data/wiki.txt --writing_params_path=./Model/vanilla.pretrain.params
elif [ "$1" = "vanilla_finetune_with_pretrain" ]; then
	if [ -f ./Model/vanilla.pretrain.params ]; then
		python3 run.py --function=finetune --variant=vanilla --pretrain_corpus_path=./data/wiki.txt --reading_params_path=./Model/vanilla.pretrain.params --writing_params_path=./Model/vanilla.finetune.params --finetune_corpus_path=./data/birth_places_train.tsv
	else
		echo "'./Model/vanilla.pretrain.params' does not exist. Please run './run.sh vanilla_pretrain' on the VM to create this file. Note: will take around 2 hours."
	fi
elif [ "$1" = "vanilla_eval_dev_with_pretrain" ]; then
	if [ -f ./Model/vanilla.finetune.params ]; then
		python3 run.py --function=evaluate --variant=vanilla --pretrain_corpus_path=./data/wiki.txt --reading_params_path=./Model/vanilla.finetune.params --eval_corpus_path=./data/birth_dev.tsv --outputs_path=./Model/vanilla.pretrain.dev.predictions
	else
		echo "'./Model/vanilla.finetune.params' does not exist. Please run './run.sh vanilla_finetune_with_pretrain' on the VM to create this file."
	fi
elif [ "$1" = "vanilla_eval_test_with_pretrain" ]; then
	if [ -f ./Model/vanilla.finetune.params ]; then
		python3 run.py --function=evaluate --variant=vanilla --pretrain_corpus_path=./data/wiki.txt --reading_params_path=./Model/vanilla.finetune.params --eval_corpus_path=./data/birth_test_inputs.tsv --outputs_path=./Model/vanilla.pretrain.test.predictions
	else
		echo "'./Model/vanilla.finetune.params' does not exist. Please run './run.sh vanilla_finetune_with_pretrain' on the VM to create this file."
	fi
elif [ "$1" = "synthesizer_pretrain" ]; then
	echo "Starting Synthesizer Pretrain: ~ 2 Hours"
	python3 run.py --function=pretrain --variant=synthesizer --pretrain_corpus_path=./data/wiki.txt --writing_params_path=./Model/synthesizer.pretrain.params	
elif [ "$1" = "synthesizer_finetune_with_pretrain" ]; then
	if [ -f ./Model/synthesizer.pretrain.params ]; then
		python3 run.py --function=finetune --variant=synthesizer --pretrain_corpus_path=./data/wiki.txt --reading_params_path=./Model/synthesizer.pretrain.params --writing_params_path=./Model/synthesizer.finetune.params --finetune_corpus_path=./data/birth_places_train.tsv
	else
		echo "'./Model/synthesizer.pretrain.params' does not exist. Please run './run.sh synthesizer_finetune_with_pretrain' on the VM to create this file. Note: will take around 2 hours."
	fi
elif [ "$1" = "synthesizer_eval_dev_with_pretrain" ]; then
	if [ -f ./Model/synthesizer.finetune.params ]; then
		python3 run.py --function=evaluate --variant=synthesizer --pretrain_corpus_path=./data/wiki.txt --reading_params_path=./Model/synthesizer.finetune.params --eval_corpus_path=./data/birth_dev.tsv --outputs_path=./Model/synthesizer.pretrain.dev.predictions	
	else
		echo "'./Model/synthesizer.finetune.params' does not exist. Please run './run.sh vanilla_finetune_with_pretrain' on the VM to create this file."
	fi
elif [ "$1" = "synthesizer_eval_test_with_pretrain" ]; then
	if [ -f ./Model/synthesizer.finetune.params ]; then
		python3 run.py --function=evaluate --variant=synthesizer --pretrain_corpus_path=./data/wiki.txt --reading_params_path=./Model/synthesizer.finetune.params --eval_corpus_path=./data/birth_test_inputs.tsv --outputs_path=./Model/synthesizer.pretrain.test.predictions	
	else
		echo "'./Model/synthesizer.finetune.params' does not exist. Please run './run.sh vanilla_finetune_with_pretrain' on the VM to create this file."
	fi 
else
	echo "Invalid Option Selected. Only Options Available Are:"
	echo "=============================================================="
	echo "./run.sh vanilla_finetune_without_pretrain"
	echo "./run.sh vanilla_eval_dev_without_pretrain"
	echo "./run.sh vanilla_eval_test_without_pretrain"
	echo "------------------------------------------------------------"
	echo "./run.sh vanilla_pretrain"
	echo "./run.sh vanilla_finetune_with_pretrain"
	echo "./run.sh vanilla_eval_dev_with_pretrain"
	echo "./run.sh vanilla_eval_test_with_pretrain"
	echo "------------------------------------------------------------"
	echo "./run.sh synthesizer_pretrain"
	echo "./run.sh synthesizer_finetune_with_pretrain"
	echo "./run.sh synthesizer_eval_dev_with_pretrain"
	echo "./run.sh synthesizer_eval_test_with_pretrain"
	echo "------------------------------------------------------------"
fi