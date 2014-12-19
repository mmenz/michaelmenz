import cherrypy, os
from cherrypy.lib.static import serve_file 

class index(object):
    @cherrypy.expose
    def index(self):
        return serve_file(os.path.join(os.getcwd(),"index.html"))

    @cherrypy.expose
    def resume(self):
        return serve_file(os.path.join(os.getcwd(),"RESUMECV_Michael_Menz.pdf"))

if __name__ == '__main__':
    conf = {
         '/': {
            'tools.sessions.on': True,
            'tools.staticdir.root': os.path.abspath(os.getcwd())
         },
         '/css': {
            'tools.staticdir.on': True,
            'tools.staticdir.dir': 'css'
         },
         '/js': {
            'tools.staticdir.on': True,
            'tools.staticdir.dir': 'js'
         },
         '/img': {
            'tools.staticdir.on': True,
            'tools.staticdir.dir': 'img'
         },
         '/font-awesome-4.1.0': {
            'tools.staticdir.on': True,
            'tools.staticdir.dir': 'font-awesome-4.1.0'
         },
    }
    webapp = index()
    cherrypy.config.update({'server.socket_host': '0.0.0.0',})
    cherrypy.config.update({'server.socket_port': int(os.environ.get('PORT', '5000')),})
    cherrypy.quickstart(webapp,'/',conf)