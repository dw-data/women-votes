# What if only women voted in Germany?

What would Germany look like if only women voted? This International Women’s Day, a look at which parties would be in power, and which decisions might have gone differently.

*In this repository, you will find the methodology, data and code behind
the story that came out of this analysis.*

Story by [Kira Schacht](https://www.twitter.com/daten_drang)

Read the full story on DW.com: [EN](https://www.dw.com/a-68277145) | [DE](https://www.dw.com/a-68335752)

## Datasets

The folder `data` contains the data our analysis is based on. There you will find:

- `votes_women_wahlstatistik.xlsx`: statistics on votes cast in German federal elections over time, by age and gender
- `bundestag_women.xlsx`: Share of women in the German parliament over time, and by party for the current parliament
    - refer to `script/bundestag_members_analyze.R` for how we extracted the numbers of women for earlier election periods
- `bundestag_women_votes.xlsx`: Selection of votes in parliament to analyze by gender
    - refer to `script/polls_analyze.R` for the more recent votes

## Data Sources

### Bundeswahlleiterin: Representative Wahlstatistik (representative voter survey)

The official [representative voter survey](https://www.bundeswahlleiterin.de/bundestagswahlen/2021/ergebnisse/repraesentative-wahlstatistik.html) is conducted after every federal parliamentary election in Germany and provides demographic data about, among others, the sex and age of voters by party, allowing analyses of differing party preferences. We used this to showcase how women voted differently than men over time, as well as in the most recent election. 
*This was accessed in February 2024, and does not reflect the repeat election held in party of Berlin in early 2024*

### Bundestag: Federal Parliament website

- [bundestag.de/abgeordnete](https://www.bundestag.de/abgeordnete) Data on the gender of current representatives by party.<br>*This was accessed on February 23, 2024, and did not yet reflect the repeat election held in party of Berlin in early 2024*
- [bundestag.de/services/opendata](https://www.bundestag.de/services/opendata) Information on all parliamentarians over time

### Abgeordnetenwatch

[Abgeordnetenwatch](https://www.abgeordnetenwatch.de/bundestag/abstimmungen) is an NGO that records information on representatives in parliament, their positions and voting behavior, going back to the election period starting 2005. We used their API to analyze recent votes held in parliament by gender of the representatives.

### DIP (Dokumentations- und Informationssystem für Parlamentsmaterialien): Parliamentary documentation system

The [DIP](https://dip.bundestag.de/) stores information on all parliamentary processes, including records on all parliamentary debates. We used this to analyze any votes held pre-2005 that were not recorded on Abgeordnetenwatch.

## Interviews

- [Dr. Elisa Deiss-Helbig](https://ecpr.eu/profile/ElisaDeiss-Helbig), Universität Konstanz
- [Dr. Ansgar Huddde](https://iss-wiso.uni-koeln.de/de/institut/personen/h/dr-ansgar-hudde), Universität Köln
- [Dr. Elke Wiechmann](https://www.fernuni-hagen.de/polis/lg4/team/elke.wiechmann.shtml), Fernuniversität Hagen
- Sophie Gumy, Technical Officer at WHO's Department of Environment, Climate Change, and Health
