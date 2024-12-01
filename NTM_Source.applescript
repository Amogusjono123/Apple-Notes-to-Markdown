tell application "Notes"
	set allNotes to notes of folder "Notes" of account "iCloud" -- Adjust folder and account name if needed
	set exportedText to ""
	repeat with aNote in allNotes
		set noteTitle to name of aNote
		set noteBody to body of aNote
		set exportedText to exportedText & "# " & noteTitle & "

" & noteBody & "

---

"
	end repeat
end tell

set outputFile to (choose file name with prompt "Save Exported Notes As:" default name "NotesExport.md")
set fileRef to open for access outputFile with write permission
write exportedText to fileRef
close access fileRef