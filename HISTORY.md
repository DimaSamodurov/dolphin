# 0.1.2 / 2011-11-17

* more explicit config
* enable static feature definition (not using flippers):

    Dolphin.features = {:wiki => true, :blog => false}

  This also solves some yaml loading effect where string values implicitly converted to boolean.

# 0.1.1 / 2011-11-17

Code was cleaned up with intention to make library a general purpose gem, not a rails plugin.
All not related logic has been mooved out of the library.

* removed FeatureStore with intention to keep only code related to 'features' and 'flippers'.
* removed cucumber specs as they are out of the domain scope
* removed test_app
* added .gemspec