#!/bin/bash
tinet build -c ebgp_sample.yaml |sh -x 
tinet up -c ebgp_sample.yaml |sh -x 
tinet conf -c ebgp_sample.yaml |sh -x 
tinet test -c ebgp_sample.yaml |sh -x 
