import yaml
from jinja2 import Template
from datetime import date


def render_build_sites_scripts(conf, sites):
    template = Template(open('src/templates/buildSites.ps1').read())
    for key, v in sites.items():
        yield (key, template.render(teams_sites=v["teams_sites"],
                                    comms_sites=v["comms_sites"],
                                    hub_name=key,
                                    mainsite_url=conf["mainsite_url"],
                                    username=conf["username"]))


def render_build_nav_scripts(conf, sites):
    template = Template(open('src/templates/buildNavs.ps1').read())
    for key, v in sites.items():
        yield (key, template.render(teams_sites=v["teams_sites"],
                                    comms_sites=v["comms_sites"],
                                    hub_name=key,
                                    mainsite_url=conf["mainsite_url"],
                                    username=conf["username"]))


def render_fields_build_scripts(conf, fields):
    template = Template(open('src/templates/addColumns.ps1').read())
    for key, v in fields.items():
        yield (key, template.render(site_lists=v,
                                    site_url=f"{conf['mainsite_url']}/teams/{key.lower()}",
                                    username=conf["username"]))


if __name__ == "__main__":
    fields_object = yaml.load(open("vars/fields.yml", "r"), Loader=yaml.Loader)
    conf_object = yaml.load(open("../conf/conf.yml", "r"), Loader=yaml.Loader)
    sites_object = yaml.load(open("vars/sites.yml", "r"), Loader=yaml.Loader)
    for k, output in render_build_sites_scripts(conf_object, sites_object):
        with open(f"../out_files/create_sites_under_{k}_{date.today()}.ps1", "w") as fh:
            fh.write(output)
    for k, output in render_build_nav_scripts(conf_object, sites_object):
        with open(f"../out_files/create_nav_under_{k}_{date.today()}.ps1", "w") as fh:
            fh.write(output)
    for k, output in render_fields_build_scripts(conf_object, fields_object):
        with open(f"../out_files/create_fields_for_{k}_{date.today()}.ps1", "w") as fh:
            fh.write(output)
