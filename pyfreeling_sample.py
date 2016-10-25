from lxml import etree
from pyfreeling import Analyzer

analyzer = Analyzer(config='es.cfg')
xml = analyzer.run('Hola Mundo')
print(etree.tostring(xml))

#analyzer = Analyzer(config='es.cfg', lang='es')
#analyzer.run('Hola mundo', 'noflush')
