<?php
require 'vendor/autoload.php';
use Alfred\Workflows\Workflow;

$workflow = new Workflow;

$text = $argv[1];

$totalWords = str_word_count($text);
$totalCharacters = strlen($text);

$workflow->result()
         ->uid('total-word')
         ->title($totalWords)
         ->icon('icon.png')
         ->subtitle('Total Words');

$workflow->result()
         ->uid('total-character')
         ->title($totalCharacters)
         ->icon('icon.png')
         ->subtitle('Total Characters');

echo $workflow->output();