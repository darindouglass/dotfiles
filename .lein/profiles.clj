{:repl {:plugins [[cider/cider-nrepl "0.26.0"]]}
 :user {:dependencies [[hashp "0.2.1"]
                       [criterium "0.4.6"]]
        :global-vars {*print-namespace-maps* false}
        :injections [(require 'hashp.core)
                     (require 'clojure.pprint)
                     (defmethod print-method clojure.lang.IPersistentMap [m, ^java.io.Writer w]
                       (#'clojure.core/print-meta m w)
                       (#'clojure.core/print-map m #'clojure.core/pr-on w))
                     (defmethod clojure.pprint/simple-dispatch clojure.lang.IPersistentMap
                       [m]
                       (with-redefs [clojure.core/lift-ns (constantly nil)]
                         (#'clojure.pprint/pprint-map m)))]
        :plugins [[lein-pprint "1.3.2"]
                  [lein-ancient "0.6.15"]]}}
