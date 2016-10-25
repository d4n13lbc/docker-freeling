from lxml import etree
from pyfreeling import Analyzer

analyzer = Analyzer(config='en.cfg')
xml = analyzer.run('Hello World')
print(etree.tostring(xml))

#analyzer = Analyzer(config='es.cfg', lang='es')
#analyzer.run('Hola mundo', 'noflush')
