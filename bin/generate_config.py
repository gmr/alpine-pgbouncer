#!/usr/bin/env python
import os
import argparse

from jinja2 import Template

def load_template(template):
    f = open(template, 'r+')
    return f.read()

def write_config(config, data):
    f = open(config, 'w')
    return f.write(data)

def generate_config(template_path, dest):
    config = os.path.join(dest, os.path.basename(template_path))
    template_string = load_template(template_path)
    template_engine = Template(template_string)
    data = template_engine.render(**os.environ)
    write_config(config, data)
    print "Wrote config to {}".format(config)


def run():
    parser = argparse.ArgumentParser(description='Generate a config file')
    parser.add_argument('--dest', metavar='destination', type=str,
                               help='destination directory')
    parser.add_argument('--template', metavar='template', type=str,
                               help='config name/template source')

    args = parser.parse_args()
    generate_config(args.template, args.dest)

if __name__ == "__main__":
    run()
