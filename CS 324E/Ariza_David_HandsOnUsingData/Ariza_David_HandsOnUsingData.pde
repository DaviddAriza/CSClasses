// AuctionItem class to hold XML data for auction items
class AuctionItem {
  String title;
  String description;

  AuctionItem(String title, String description) {
    this.title = title;
    this.description = description;
  }
}

// SampleData class to hold JSON data
class SampleData {
  String name;
  int age;

  SampleData(String name, int age) {
    this.name = name;
    this.age = age;
  }
}

XML xml;
ArrayList<AuctionItem> auctionItems = new ArrayList<>();
JSONObject json;
ArrayList<SampleData> sampleDataList = new ArrayList<>();

void setup() {
  size(800, 600);
  loadXMLData();
  printData();
}

// Load and parse XML data
void loadXMLData() {
  xml = loadXML("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/auctions/ebay.xml");
  
  if (xml == null) {
    println("Failed to load XML data");
    exit();
  }
  
  XML[] items = xml.getChildren("item");
  for (XML item : items) {
    String title = item.getChild("title").getContent();
    String description = item.getChild("description").getContent();
    auctionItems.add(new AuctionItem(title, description));
  }
}

// Print loaded data to console
void printData() {
  println("Auction Items from XML:");
  for (AuctionItem auction : auctionItems) {
    println("Title: " + auction.title);
    println("Description: " + auction.description);
    println();
  }
}

void draw() {
  background(255);
  text("Check console for loaded XML and JSON data", 20, height/2);
}
