# Autogenerated wrapper script for QD_jll for x86_64-apple-darwin14-cxx03
export libqd, libqd_f_main, libqdmod

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"

# Relative path to `libqd`
const libqd_splitpath = ["lib", "libqd.0.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libqd_path = ""

# libqd-specific global declaration
# This will be filled out by __init__()
libqd_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libqd = "@rpath/libqd.0.dylib"


# Relative path to `libqd_f_main`
const libqd_f_main_splitpath = ["lib", "libqd_f_main.0.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libqd_f_main_path = ""

# libqd_f_main-specific global declaration
# This will be filled out by __init__()
libqd_f_main_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libqd_f_main = "@rpath/libqd_f_main.0.dylib"


# Relative path to `libqdmod`
const libqdmod_splitpath = ["lib", "libqdmod.0.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libqdmod_path = ""

# libqdmod-specific global declaration
# This will be filled out by __init__()
libqdmod_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libqdmod = "@rpath/libqdmod.0.dylib"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"QD")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libqd_path = normpath(joinpath(artifact_dir, libqd_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libqd_handle = dlopen(libqd_path)
    push!(LIBPATH_list, dirname(libqd_path))

    global libqd_f_main_path = normpath(joinpath(artifact_dir, libqd_f_main_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libqd_f_main_handle = dlopen(libqd_f_main_path)
    push!(LIBPATH_list, dirname(libqd_f_main_path))

    global libqdmod_path = normpath(joinpath(artifact_dir, libqdmod_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libqdmod_handle = dlopen(libqdmod_path)
    push!(LIBPATH_list, dirname(libqdmod_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

