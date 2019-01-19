
[1mFrom:[0m /home/christian/.rvm/gems/ruby-2.5.1/gems/bootsnap-1.3.2/lib/bootsnap/load_path_cache/core_ext/active_support.rb @ line 57 Bootsnap::LoadPathCache::CoreExt::ActiveSupport::ClassMethods#load_missing_constant:

    [1;34m56[0m: [32mdef[0m [1;34mload_missing_constant[0m(from_mod, const_name)
 => [1;34m57[0m:   [1;34;4mCoreExt[0m::[1;34;4mActiveSupport[0m.allow_bootsnap_retry([1;36mfalse[0m) [32mdo[0m
    [1;34m58[0m:     [32msuper[0m
    [1;34m59[0m:   [32mend[0m
    [1;34m60[0m: [32mrescue[0m [1;34;4mNameError[0m => e
    [1;34m61[0m:   [1;34m# This function can end up called recursively, we only want to[0m
    [1;34m62[0m:   [1;34m# retry at the top-level.[0m
    [1;34m63[0m:   raise [32mif[0m [1;34;4mThread[0m.current[[33m:without_bootsnap_retry[0m]
    [1;34m64[0m:   [1;34m# If we already had cache disabled, there's no use retrying[0m
    [1;34m65[0m:   raise [32mif[0m [1;34;4mThread[0m.current[[33m:without_bootsnap_cache[0m]
    [1;34m66[0m:   [1;34m# NoMethodError is a NameError, but we only want to handle actual[0m
    [1;34m67[0m:   [1;34m# NameError instances.[0m
    [1;34m68[0m:   raise [32munless[0m e.class == [1;34;4mNameError[0m
    [1;34m69[0m:   [1;34m# We can only confidently handle cases when *this* constant fails[0m
    [1;34m70[0m:   [1;34m# to load, not other constants referred to by it.[0m
    [1;34m71[0m:   raise [32munless[0m e.name == const_name
    [1;34m72[0m:   [1;34m# If the constant was actually loaded, something else went wrong?[0m
    [1;34m73[0m:   raise [32mif[0m from_mod.const_defined?(const_name)
    [1;34m74[0m:   [1;34;4mCoreExt[0m::[1;34;4mActiveSupport[0m.without_bootsnap_cache { [32msuper[0m }
    [1;34m75[0m: [32mend[0m

