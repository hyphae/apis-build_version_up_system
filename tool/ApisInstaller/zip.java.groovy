
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
try {
	Zipper zipper = new Zipper(sourceDirPath);
	zipper.exec(zipFilePath);
} catch (Exception e) {
	println("Exception: ${e}");
	System.exit(1)
}

def zipFile = new File(zipFilePath)
println '##productPath:' + zipFile.getCanonicalPath()

System.exit(0)

////

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.attribute.FileTime;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class Zipper {
	private File sourceDir;

	Zipper(String sourceDirPath) {
		sourceDir = new File(sourceDirPath);
	}

	public void exec(String zipFilePath) {
		ZipOutputStream zos = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(zipFilePath)));
		try {
			execRecursive(sourceDir, zos);
		} finally {
			zos.finish();
			zos.close();
		}
	}
	private void execRecursive(File node, ZipOutputStream zos) {
		if (!node.equals(sourceDir)) {
			if (node.isDirectory()){
				addDir(node, zos);
			} else /* if (!node.isHidden()) */ {
				addFile(node, zos);
			}
		}
		if (node.isDirectory()) {
			for (File subNode : node.listFiles()) {
				execRecursive(subNode, zos);
			}
		}
	}
	private void addDir(File node, OutputStream zos) {
		ZipEntry ze = new ZipEntry(node.getCanonicalPath().substring(sourceDir.getCanonicalPath().length() + 1) + File.separator);
		ze.setMethod(ZipEntry.STORED);
		ze.setLastModifiedTime(FileTime.fromMillis(node.lastModified()));
		ze.setSize(0);
		ze.setCrc(0);
		zos.putNextEntry(ze);
		zos.closeEntry();
	}
	private void addFile(File node, OutputStream zos) {
		ZipEntry ze = new ZipEntry(node.getCanonicalPath().substring(sourceDir.getCanonicalPath().length() + 1));
		ze.setMethod(ZipEntry.DEFLATED);
		ze.setLastModifiedTime(FileTime.fromMillis(node.lastModified()));
		zos.putNextEntry(ze);
		byte[] buf = new byte[1024];
		FileInputStream fis = new FileInputStream(node);
		try {
			int len;
			while (0 < (len = fis.read(buf))) {
				zos.write(buf, 0, len);
			}
		} finally {
			fis.close();
			zos.closeEntry();
		}
	}
}
