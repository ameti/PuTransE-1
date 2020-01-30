from triples import KnowledgeGraph
from Train import Experiment
import copy

# initialize Freebase Dataset
#fb = KnowledgeGraph.factory('Fb15k')
#fb = KnowledgeGraph.factory('Fb15k-237')
fb = KnowledgeGraph.factory('Wn18')
#fb = KnowledgeGraph.factory('Wn18RR')
#fb = KnowledgeGraph.factory('YAGO3-10')


num_of_epochs = 1000
validation_freq = 1000
batch_size = 100
margin = 2 #
norm = 2
learning_rate = 0.01
num_of_dimensions = 25

transE_experiment = Experiment(knowledge_graph=fb, num_of_epochs=num_of_epochs, batch_size=batch_size, margin=margin,
                               norm=norm, learning_rate=learning_rate, num_of_dimensions=num_of_dimensions, validation_freq=validation_freq)
transE_experiment.train()

