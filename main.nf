#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

params.hello='Bonjour,Ciao,Hello,Hola'

process sayHello {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
}

workflow {
  Channel.fromList( params.hello.tokenize(',') ) | sayHello | view
}
