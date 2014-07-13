global class DynamicAccFields {
private ApexPages.StandardSetController controller;
private PageReference savePage;
private Set<String> unSelectedNames = new Set<String>();
private Set<String> selectedNames = new Set<String> ();
private Set<String> inaccessibleNames = new Set<String>();
public List<String> selected {get; set; }
public List<String> unselected {get; set; }
public DynamicAccFields () {
init();
}
public DynamicAccFields (ApexPages.StandardSetController controller) {
this.controller = controller;
init();
}
public PageReference show() {
controller.reset();
controller.addFields(new List<String>(selectedNames));
// See additional notes below for the previous Apex methods
List<String> displayedNames = new List<String>(selectedNames);
displayedNames.sort();
displayFields = displayedNames;
return savePage;
}
public PageReference Customize() {
savePage = ApexPages.CurrentPage();
return Page.DynamicAccFieldList;
}
// The methods below are for constructing the select list
private void init() {
Map<String, Schema.SobjectField> fields =
Schema.SobjectType.Account.fields.getMap();
for (String s : fields.keySet()) {
if (s != 'Name') { // name is always displayed
unSelectedNames.add(s);
}
if (!fields.get(s).getDescribe().isAccessible()) {
inaccessibleNames.add(s);
}
}
}
public List<SelectOption> selectedOptions { get
{
List<String> sorted = new List<String>(selectedNames);
sorted.sort();
List<SelectOption> options = new List<SelectOption>();
for (String s : sorted) {
options.add(new SelectOption(s, fixName(s)));
}
return options;
}
}
public List<SelectOption> unSelectedOptions { get
{
List<String> sorted = new List<String>(unSelectedNames);
sorted.sort();
List<SelectOption> options = new List<SelectOption>();
for (String s : sorted) {
options.add(new SelectOption(s, fixName(s)));
}
return options;
}
}
private String fixName(String s) {
return inaccessibleNames.contains(s) ? '*' + s : s;
}
public void doSelect() {
for (String s: selected) {
selectedNames.add(s);
unselectedNames.remove(s);
}
}
public void doUnSelect() {
for (String s: unselected) {
unSelectedNames.add(s);
selectedNames.remove(s);
}
}
public List<String> displayFields {
get; private set;
}
}