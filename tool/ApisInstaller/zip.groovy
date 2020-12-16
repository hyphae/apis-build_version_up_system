
// Check the number of command-line arguments
if (args.length < 4) {
    println "Usage: groovy zip.groovy -in <sourceDirPath> -out <zipFilePath>"
    System.exit(1)
}

// Command line arguments get
def sourceDirPath = ""
def zipFilePath = ""
args.eachWithIndex { item, index ->
    if (item == "-in") {
        sourceDirPath = args[index + 1]
    } else if (item == "-out") {
        zipFilePath = args[index + 1]
    }
}

// DEBUG START
println "sourceDirPath = ${sourceDirPath}"
println "zipFilePath = ${zipFilePath}"
// DEBUG END

println '##progress:archiving'

// Execute
def sourceDir = new File(sourceDirPath)
def zipFile = new File(zipFilePath)
def execDir = sourceDir.getParentFile()
def execCommand = ['zip', '-r', zipFile.getCanonicalPath(), sourceDir.getName()]

// DEBUG START
println 'execCommand = ' + execCommand
// DEBUG END

def sout = new StringBuilder(), serr = new StringBuilder()
def proc = execCommand.execute(null, execDir)
proc.consumeProcessOutput(sout, serr)
def execResult = proc.waitFor()

// DEBUG START
println 'execResult = ' + execResult
// DEBUG END

if (execResult != 0) {
    println "ERROR ${execResult} : ${execCommand}"
    System.exit(1)
}

println '##productPath:' + zipFile.getCanonicalPath()

System.exit(0)

