module Paths_servant_hw (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/kot/github/servant-hw/.stack-work/install/x86_64-linux/lts-6.15/7.10.3/bin"
libdir     = "/home/kot/github/servant-hw/.stack-work/install/x86_64-linux/lts-6.15/7.10.3/lib/x86_64-linux-ghc-7.10.3/servant-hw-0.1.0.0-2SUUezYsOCdDF97MD4bdZc"
datadir    = "/home/kot/github/servant-hw/.stack-work/install/x86_64-linux/lts-6.15/7.10.3/share/x86_64-linux-ghc-7.10.3/servant-hw-0.1.0.0"
libexecdir = "/home/kot/github/servant-hw/.stack-work/install/x86_64-linux/lts-6.15/7.10.3/libexec"
sysconfdir = "/home/kot/github/servant-hw/.stack-work/install/x86_64-linux/lts-6.15/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "servant_hw_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "servant_hw_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "servant_hw_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "servant_hw_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "servant_hw_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
