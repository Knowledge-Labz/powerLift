from src import render_functions
from PyInquirer import prompt
import yaml
from datetime import date


def gen_scripts():
    c1 = 'Prepare the sites deployment scripts (sites.yml)'
    c2 = 'Prepare the navigation building scripts (sites.yml)'
    c3 = 'Prepare the fields scripts for lists in sites (fields.yml)'
    c4 = 'Prepare everything!'
    fields_object = yaml.load(open("src/vars/fields.yml", "r"), Loader=yaml.Loader)
    conf_object = yaml.load(open("conf/conf.yml", "r"), Loader=yaml.Loader)
    sites_object = yaml.load(open("src/vars/sites.yml", "r"), Loader=yaml.Loader)
    question = {
            'type': 'list',
            'name': 'build',
            'message': 'What do you want to do?',
            'choices': [c1, c2, c3, c4]
        }
    answer = prompt(question)
    if answer['build'] == c1:
        for k, output in render_functions.render_build_sites_scripts(conf_object, sites_object):
            with open(f"out_files/create_sites_under_{k}_{date.today()}.ps1", "w") as fh:
                fh.write(output)
    elif answer['build'] == c2:
        for k, output in render_functions.render_build_nav_scripts(conf_object, sites_object):
            with open(f"out_files/create_nav_under_{k}_{date.today()}.ps1", "w") as fh:
                fh.write(output)
    elif answer['build'] == c3:
        for k, output in render_functions.render_fields_build_scripts(conf_object, fields_object):
            with open(f"out_files/create_fields_for_{k}_{date.today()}.ps1", "w") as fh:
                fh.write(output)
    elif answer['build'] == c4:
        for k, output in render_functions.render_build_sites_scripts(conf_object, sites_object):
            with open(f"out_files/create_sites_under_{k}_{date.today()}.ps1", "w") as fh:
                fh.write(output)
        for k, output in render_functions.render_build_nav_scripts(conf_object, sites_object):
            with open(f"out_files/create_nav_under_{k}_{date.today()}.ps1", "w") as fh:
                fh.write(output)
        for k, output in render_functions.render_fields_build_scripts(conf_object, fields_object):
            with open(f"out_files/create_fields_for_{k}_{date.today()}.ps1", "w") as fh:
                fh.write(output)


if __name__ == '__main__':
    gen_scripts()
