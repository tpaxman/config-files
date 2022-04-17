from bs4 import BeautifulSoup

# get soup from url:
response = requests.get(url)
html_text = response.text
soup = BeautifulSoup(html_text, "html.parser")

# get soup from file:
with open(filename) as f:
    soup = BeautifulSoup(f, 'html.parser')

# get soup from string:
soup = BeautifulSoup('<b class="boldest">Extremely bold</b>', 'html.parser')

# get tag:
b_tag = soup.b

# get name of tag:
b_tag.name  # 'b'

# get an attribute from tag:
b_tag['class']
b_tag.attrs['class']  # 'boldest'

# get tag's children:
tag.contents # (returns a list of direct children)
tag.children # (returns a generator of direct children)
tag.descendants # (returns generator or all children recursively)

# find by class:
tag.find(class_='name-of-class')
tag.find(attrs={'class': 'name-of-class'})

def soupify_url(url: str) -> BeautifulSoup:
    return BeautifulSoup(requests.get(url).text)


def soupify_file(filename):
    with open(filename, encoding='utf-8') as f:
        return BeautifulSoup(f.read())


def download_page_source_to_file(url: str, filename: str) -> None:
    response = requests.get(url)
    content = response.text
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(content)
