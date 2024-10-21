---
title: ''
output: md_document
#always_allow_html: true # only pandoc cares
lot: false # insert a list of tables
lof: false # insert a list of figures
knit: (function(inputFile, encoding) { knitted <- rmarkdown::render(inputFile, encoding=encoding, run_pandoc = FALSE); body <- readr::read_file(knitted); httr::POST(url = "http://localhost:3000/mdx?test=true", body = body, httr::write_disk(gsub(".Rmd", ".pdf", inputFile), overwrite = TRUE)); print("done") })
xknit: (function(inputFile, encoding) { knitted <- rmarkdown::render(inputFile, encoding=encoding, run_pandoc = FALSE); body <- readr::read_file(knitted); httr::POST(url = "http://localhost:3000/mdx?test=true", body = body, httr::write_disk(gsub(".Rmd", ".pdf", inputFile), overwrite = TRUE)); file.remove(knitted); print("done") })
params:
  Year: 2024
---




<CoverPage2
	product="Chestionar OSP"
	reportName="București"
	productFontSize="text-7xl"
  coverPhoto="/eindtoets-tall.jpg"
	variant="schoolreport"
	slopeTop={178}
	titleTop={92}
	showConfidentiality={false}
	>
	<Col>
## Raport pentru

# Chestionarul privind opțiunile școlare și profesionale ale elevilor de clasa a VIII-a 

## 2024-2025

## București
</Col>
</CoverPage2>

<Page
	product="Chestionar OSP București"
	title="Participare"
	icon="page-stack">
	
	# 1. Participarea la „Chestionarul privind opțiunile școlare și profesionale ale elevilor de clasa a VIII-a”:
	## 1. Participarea la „Chestionarul privind opțiunile școlare și profesionale ale elevilor de clasa a VIII-a”:
<Cols variant="eindtoets">
<Col>

<Table
  
    headers={["Opțiuni exprimate","Total B","Din S1","Din S2","Din S3","Din S4","Din S5","Din S6"]}
    data={[
  ["Numărul total al elevilor de clasa a VIII-a participanți", 12433, 2019, 2123, 2289, 1758, 1576, 2668],
  ["Numărul total al elevilor de clasa a VIII-a participanți care au răspuns la chestionar", 9911, 1331, 1705, 1992, 1345, 1242, 2296],
  ["Numărul total al elevilor de clasa a VIII-a participanți care au început, dar nu au finalizat completarea chestionarului", 192, 21, 28, 39, 35, 26, 43],
  ["Numărul total al elevilor de clasa a VIII-a participanți care nu au răspuns la chestionar", 2330, 667, 390, 258, 378, 308, 329],
  ["Numărul total al elevilor de clasa a VIII-a participanți care au răspuns la chestionar și doresc să continue studiile după terminarea clasei a VIII-a", 9852, 1323, 1697, 1969, 1340, 1232, 2291],
  ["Numărul total al elevilor de clasa a VIII-a participanți care au răspuns la chestionar, dar nu doresc să continue studiile după terminarea clasei a VIII-a", 59, 8, 8, 23, 5, 10, 5]
]}
    classNames={["w-2/5","text-right","text-right","text-right","text-right","text-right","text-right","text-right"]}
    pillColors={{}}
  />

</Col>
</Cols>

<Cols>


<Col className="w-1/2">
<DonutChart
    values={ [9911,192,2330] }
    
    colors={ ["#83C5EC","#4B9ED8","#94CC2F"] }
    radius={16.5}
    threshold={0}
  />
<Pill color={0}/> Numărul total al elevilor de clasa a VIII-a participanți care au răspuns la chestionar<br/>
<Pill color={1}/> Numărul total al elevilor de clasa a VIII-a participanți care au început, dar nu au finalizat completarea chestionarului<br/>
<Pill color={2}/> Numărul total al elevilor de clasa a VIII-a participanți care nu au răspuns la chestionar<br/>

</Col>


<Col className="w-1/2">
<DonutChart
    values={ [9852,59] }
    
    colors={ ["#F9DF4B","#F1A040"] }
    radius={16.5}
    threshold={0}
  />
<Pill color={3}/> Numărul total al elevilor de clasa a VIII-a participanți care au răspuns la chestionar și doresc să continue studiile după terminarea clasei a VIII-a<br/>
<Pill color={4}/> Numărul total al elevilor de clasa a VIII-a participanți care au răspuns la chestionar, dar nu doresc să continue studiile după terminarea clasei a VIII-a<br/>


</Col>
</Cols>
</Page>

<Page
	product="Chestionar OSP București"
	title="Scoli participante"
	icon="page-stack">
	
	## 1.1 Unitățile de învățământ participante la chestionar:
	<Cols variant="eindtoets">
<Col>

<Table
  
    headers={["Sectorul","Unitatea de învățământ","Total elevi participanți","Total elevi participanți care au răspuns la chestionar"]}
    data={[
  [1, "Colegiul Național „Ion Luca Caragiale” București", 26, 23],
  [1, "Colegiul Național „Ion Neculce” București", 62, 46],
  [1, "Colegiul Național de Informatică „Tudor Vianu” București", 49, 46],
  [1, "Colegiul de Muzică „G. Enescu” București", 48, 7],
  [1, "Colegiul German „Goethe” București", 124, 70],
  [1, "Colegiul Tehnic Feroviar „Mihai I” București", 20, 20],
  [1, "Liceul de Arte Plastice „N. Tonitza” București", 55, 24],
  [1, "Liceul Greco-Catolic „Timotei Cipariu” București", 66, 0],
  [1, "Liceul Teoretic „Alexandru Vlahuță” București", 92, 89],
  [1, "Liceul Teoretic „Jean Monnet” București", 113, 100],
  [1, "Liceul Teoretic „Nicolae Iorga” București", 99, 86],
  [1, "Liceul Teoretic Bilingv „Miguel de Cervantes” București", 73, 22],
  [1, "Liceul Teoretic Bulgar „Hristo Botev” București", 0, 0],
  [1, "Școala Gimnazială „Alexandru Costescu” București", 70, 49],
  [1, "Școala Gimnazială „Elena Văcărescu” București", 102, 87],
  [1, "Școala Gimnazială „Eugen Barbu” București", 29, 23],
  [1, "Școala Gimnazială „Geo Bogza” București", 75, 54],
  [1, "Școala Gimnazială „Herăstrău” București", 148, 116],
  [1, "Școala Gimnazială „I. H. Rădulescu” București", 71, 67],
  [1, "Școala Gimnazială „Nicolae Grigorescu” București", 0, 0],
  [1, "Școala Gimnazială „Nicolae Titulescu” București", 87, 50],
  [1, "Școala Gimnazială „Petre Ispirescu” București", 33, 29],
  [1, "Școala Gimnazială „Pia Brătianu” București", 160, 143],
  [1, "Școala Gimnazială „Sf. Nicolae” București", 40, 34],
  [1, "Școala Gimnazială „Uruguay” București", 19, 11],
  [1, "Școala Gimnazială „Vasile Alecsandri” București", 19, 16],
  [1, "Școala Gimnazială Nr. 1 „Sfinții Voievozi” București", 68, 37],
  [1, "Școala Gimnazială Nr. 5 București", 45, 39],
  [1, "Școala Gimnazială Nr. 6 București", 13, 9],
  [1, "Școala Gimnazială Nr. 7 București", 72, 33],
  [1, "Școala Gimnazială Nr. 13 București", 31, 29],
  [1, "Școala Gimnazială Nr. 45 „Titu Maiorescu” București", 147, 79],
  [1, "Școala Gimnazială Nr. 162 București", 0, 0],
  [1, "Școala Gimnazială Nr. 178 București", 27, 22],
  [1, "Școala Gimnazială Nr. 179 București", 140, 91],
  [1, "Școala Gimnazială Nr. 181 București", 37, 32],
  [1, "Școala Gimnazială Nr. 183 București", 25, 15],
  [1, "Școala Gimnazială Nr. 184 București", 10, 9],
  [1, "Școala Gimnazială Nr. 192 București", 0, 0],
  [2, "Colegiul Național „Cantemir Vodă” București", 29, 25],
  [2, "Colegiul Național „Emil Racoviță” București", 32, 32],
  [2, "Colegiul Național „Spiru Haret” București", 27, 24],
  [2, "Colegiul Național „Victor Babeș” București", 0, 0],
  [2, "Colegiul Național Bilingv „George Coșbuc” București", 81, 55],
  [2, "Liceul Tehnologic „Sf. Pantelimon” București", 23, 19],
  [2, "Liceul Teoretic Bilingv Ita Wegman București", 48, 35],
  [2, "Liceul Teoretic „Ady Endre” București", 6, 5],
  [2, "Liceul Teoretic „Lucian Blaga” București", 37, 34],
  [2, "Școala Centrală București", 110, 103],
  [2, "Școala Gimnazială „Ferdinand I” București", 66, 48],
  [2, "Școala Gimnazială „Grigorie Ghica Voievod” București", 104, 94],
  [2, "Școala Gimnazială „Iancului” București", 62, 38],
  [2, "Școala Gimnazială „Maica Domnului” București", 46, 37],
  [2, "Școala Gimnazială „Maria Rosetti” București", 108, 97],
  [2, "Școala Gimnazială „Petre Ghelmez” București", 91, 72],
  [2, "Școala Gimnazială „Sf. Silvestru” București", 20, 20],
  [2, "Școala Gimnazială „Tudor Arghezi” București", 51, 44],
  [2, "Școala Gimnazială Nr. 4 București", 49, 39],
  [2, "Școala Gimnazială Nr. 24 București", 56, 49],
  [2, "Școala Gimnazială Nr. 25 București", 11, 9],
  [2, "Școala Gimnazială Nr. 27 București", 145, 145],
  [2, "Școala Gimnazială Nr. 28 București", 87, 35],
  [2, "Școala Gimnazială Nr. 31 București", 36, 36],
  [2, "Școala Gimnazială Nr. 32 București", 68, 59],
  [2, "Școala Gimnazială Nr. 39 București", 57, 48],
  [2, "Școala Gimnazială Nr. 40 București", 46, 37],
  [2, "Școala Gimnazială Nr. 41 București", 35, 32],
  [2, "Școala Gimnazială Nr. 46 București", 81, 46],
  [2, "Școala Gimnazială Nr. 49 București", 151, 81],
  [2, "Școala Gimnazială Nr. 51 București", 76, 71],
  [2, "Școala Gimnazială Nr. 56 București", 105, 72],
  [2, "Școala Gimnazială Nr. 62 București", 77, 75],
  [2, "Școala Gimnazială Nr. 66 București", 0, 0],
  [2, "Școala Gimnazială Nr. 71 București", 14, 11],
  [2, "Școala Gimnazială Nr. 77 București", 33, 30],
  [2, "Școala Gimnazială Nr. 85 București", 25, 23],
  [2, "Școala Gimnazială Nr. 145 București", 18, 13],
  [2, "Școala Gimnazială Nr. 307 București", 78, 78],
  [3, "Liceul Teoretic „Dante Alighieri” București", 87, 74],
  [3, "Liceul Teoretic „Decebal” București", 11, 11],
  [3, "Liceul Teoretic „Nichita Stănescu” București", 37, 32],
  [3, "Școala Gimnazială „Al. I. Cuza” București", 88, 81],
  [3, "Școala Gimnazială „Barbu Delavrancea” București", 3, 3],
  [3, "Școala Gimnazială „Cezar Bolliac” București", 82, 70],
  [3, "Școala Gimnazială „Federico Garcia Lorca” București", 98, 97],
  [3, "Școala Gimnazială „Leonardo da Vinci” București", 119, 103],
  [3, "Școala Gimnazială „Liviu Rebreanu” București", 0, 0],
  [3, "Școala Gimnazială „Mexic” București", 10, 9],
  [3, "Școala Gimnazială „Mihai Botez” București", 20, 5],
  [3, "Școala Gimnazială „Nicolae Labiș” București", 84, 78],
  [3, "Școala Gimnazială „Voievod Neagoe Basarab” București", 17, 14],
  [3, "Școala Gimnazială Nr. 20 București", 103, 101],
  [3, "Școala Gimnazială Nr. 47 București", 4, 2],
  [3, "Școala Gimnazială Nr. 54 București", 37, 26],
  [3, "Școala Gimnazială Nr. 55 București", 61, 26],
  [3, "Școala Gimnazială Nr. 67 București", 23, 9],
  [3, "Școala Gimnazială Nr. 78 București", 11, 11],
  [3, "Școala Gimnazială Nr. 80 București", 136, 91],
  [3, "Școala Gimnazială Nr. 81 București", 80, 68],
  [3, "Școala Gimnazială Nr. 82 București", 65, 65],
  [3, "Școala Gimnazială Nr. 84 București", 127, 126],
  [3, "Școala Gimnazială Nr. 86 București", 44, 44],
  [3, "Școala Gimnazială Nr. 88 „Shanghai” București", 102, 99],
  [3, "Școala Gimnazială Nr. 92 București", 52, 51],
  [3, "Școala Gimnazială Nr. 95 București", 0, 0],
  [3, "Școala Gimnaziala Nr. 112 București", 77, 62],
  [3, "Școala Gimnazială Nr. 116 București", 45, 45],
  [3, "Școala Gimnazială Nr. 149 București", 136, 112],
  [3, "Școala Gimnazială Nr. 195 București", 398, 349],
  [3, "Școala Gimnazială Nr. 200 București", 47, 43],
  [4, "Colegiul Național „Mihai Eminescu” București", 16, 11],
  [4, "Colegiul Național de Arte „Dinu Lipatti” București", 0, 0],
  [4, "Colegiul Tehnic „Petru Rareș” București", 0, 0],
  [4, "Liceul de Coregrafie „Floria Capsali” București", 0, 0],
  [4, "Școala Gimnazială „Avram Iancu” București", 91, 84],
  [4, "Școala Gimnazială „Emil Racoviță” București", 36, 13],
  [4, "Școala Gimnazială „General Eremia Grigorescu” București", 73, 66],
  [4, "Școala Gimnazială „George Bacovia” București", 57, 53],
  [4, "Școala Gimnazială „George Topârceanu” București", 47, 42],
  [4, "Școala Gimnazială „Ienăchiță Văcărescu” București", 0, 0],
  [4, "Școala Gimnazială „Ionel Teodoreanu” București", 84, 70],
  [4, "Școala Gimnazială Nr. 79 București", 141, 120],
  [4, "Școala Gimnazială Nr. 96 București", 36, 35],
  [4, "Școala Gimnazială Nr. 97 București", 65, 38],
  [4, "Școala Gimnazială Nr. 99 București", 67, 0],
  [4, "Școala Gimnazială Nr. 108 București", 19, 17],
  [4, "Școala Gimnazială Nr. 109 „Șerban Vodă” București", 48, 0],
  [4, "Școala Gimnazială Nr. 113 București", 101, 98],
  [4, "Școala Gimnazială Nr. 119 București", 86, 86],
  [4, "Școala Gimnazială Nr. 120 „Mărțișor” București", 35, 30],
  [4, "Școala Gimnazială Nr. 129 București", 41, 26],
  [4, "Școala Gimnazială Nr. 133 București", 60, 19],
  [4, "Școala Gimnazială Nr. 165 București", 45, 32],
  [4, "Școala Gimnazială Nr. 189 București", 81, 38],
  [4, "Școala Gimnazială Nr. 190 București", 252, 197],
  [4, "Școala Gimnazială Nr. 194 București", 184, 181],
  [4, "Școala Gimnazială Nr. 308 București", 49, 45],
  [5, "Colegiul Național „Gheorghe Lazăr” București", 31, 30],
  [5, "Colegiul Economic „Viilor” București", 0, 0],
  [5, "Liceul Teoretic „Dimitrie Bolintineanu” București", 110, 100],
  [5, "Liceul Teoretic „Ion Barbu” București", 81, 79],
  [5, "Liceul Teoretic „Ștefan Odobleja” București", 107, 72],
  [5, "Școala Gimnazială „G. Tocilescu” București", 8, 7],
  [5, "Școala Gimnazială „George Călinescu” București", 24, 9],
  [5, "Școala Gimnazială „I. G. Duca” București", 67, 58],
  [5, "Școala Gimnazială „Ion I. C. Brătianu” București", 39, 20],
  [5, "Școala Gimnazială „Luceafărul” București", 77, 68],
  [5, "Școala Gimnazială „Mircea Sântimbreanu” București", 83, 83],
  [5, "Școala Gimnazială „Petrache Poenaru” București", 31, 20],
  [5, "Școala Gimnazială „Principesa Margareta” București", 61, 45],
  [5, "Școala Gimnazială Nr. 2 București", 0, 0],
  [5, "Școala Gimnazială Nr. 103 București", 26, 24],
  [5, "Școala Gimnazială Nr. 115 București", 24, 21],
  [5, "Școala Gimnazială Nr. 124 București", 74, 40],
  [5, "Școala Gimnazială Nr. 125 București", 0, 0],
  [5, "Școala Gimnazială Nr. 126 București", 24, 23],
  [5, "Școala Gimnazială Nr. 127 București", 53, 21],
  [5, "Școala Gimnazială Nr. 128 București", 33, 32],
  [5, "Școala Gimnazială Nr. 131 București", 112, 99],
  [5, "Școala Gimnazială Nr. 134 București", 32, 23],
  [5, "Școala Gimnazială Nr. 135 București", 23, 19],
  [5, "Școala Gimnazială Nr. 136 București", 30, 21],
  [5, "Școala Gimnazială Nr. 143 București", 29, 28],
  [5, "Școala Gimnazială Nr. 144 București", 16, 15],
  [5, "Școala Gimnazială Nr. 150 București", 98, 43],
  [5, "Școala Gimnazială Nr. 188 București", 57, 53],
  [5, "Școala Gimnazială Nr. 280 București", 180, 143],
  [6, "Colegiul Național „Elena Cuza” București", 92, 57],
  [6, "Colegiul Național „Grigore Moisil” București", 58, 57],
  [6, "Colegiul Economic „Costin C. Kirițescu” București", 23, 21],
  [6, "Liceul cu Program Sportiv „Mircea Eliade” București", 38, 35],
  [6, "Liceul Tehnologic „Sf. Antim Ivireanu” București", 74, 40],
  [6, "Liceul Teoretic „Eugen Lovinescu” București", 74, 72],
  [6, "Liceul Teoretic „Marin Preda” București", 108, 98],
  [6, "Școala Gimnazială „Adrian Păunescu” București", 72, 63],
  [6, "Școala Gimnazială „Constantin Brâncuși” București", 68, 42],
  [6, "Școala Gimnazială „Ion Dumitriu” București", 40, 29],
  [6, "Școala Gimnazială „Regele Mihai I” București", 65, 61],
  [6, "Școala Gimnazială „Sfânta Treime” București", 80, 64],
  [6, "Școala Gimnazială „Sfântul Calinic De La Cernica” București", 58, 41],
  [6, "Școala Gimnazială „Sfinții Constantin și Elena” București", 74, 68],
  [6, "Școala Gimnazială Nr. 59 București", 104, 93],
  [6, "Școala Gimnazială Nr. 117 București", 182, 182],
  [6, "Școala Gimnazială Nr. 142 București", 52, 46],
  [6, "Școala Gimnazială Nr. 153 București", 16, 12],
  [6, "Școala Gimnazială Nr. 156 București", 107, 104],
  [6, "Școala Gimnazială Nr. 161 București", 11, 8],
  [6, "Școala Gimnazială Nr. 163 București", 70, 70],
  [6, "Școala Gimnazială Nr. 164 București", 0, 0],
  [6, "Școala Gimnazială Nr. 167 București", 33, 20],
  [6, "Școala Gimnazială Nr. 168 București", 18, 10],
  [6, "Școala Gimnazială Nr. 169 București", 117, 103],
  [6, "Școala Gimnazială „Sf. Andrei” București", 175, 127],
  [6, "Școala Gimnazială Nr. 193 București", 98, 87],
  [6, "Școala Gimnazială Nr. 197 București", 142, 140],
  [6, "Școala Gimnazială Nr. 198 București", 185, 168],
  [6, "Școala Gimnazială Nr. 206 București", 70, 62],
  [6, "Școala Gimnazială Nr. 279 București", 79, 68],
  [6, "Școala Gimnazială Nr. 309 București", 73, 44],
  [6, "Școala Gimnazială Nr. 311 București", 45, 37]
]}
    classNames={["","w-1/2","text-right","text-right"]}
    pillColors={{}}
  />

</Col>
</Cols>
</Page>


<Page
	product="Chestionar OSP București"
	title="Întrebarea 4"
	icon="page-stack">

# 4. Ce i-a influențat cel mai mult pe elevi în alegerea făcută?
<Cols variant="eindtoets">
<Col>

<Table
  
    headers={["Opțiuni exprimate","Total B","Din S1","Din S2","Din S3","Din S4","Din S5","Din S6"]}
    data={[
  ["a. Aptitudinile personale", 4562, 605, 768, 903, 646, 550, 1090],
  ["b. Prestigiul școlii", 2557, 406, 464, 480, 310, 275, 622],
  ["c. Apropierea școlii de casă", 3324, 476, 598, 606, 402, 432, 810],
  ["d. Perspectiva financiară oferită de domeniul profesional ales pentru care se pregătesc", 1250, 139, 186, 237, 198, 170, 320],
  ["e. Oportunitățile de pe piața muncii", 1230, 160, 223, 236, 161, 153, 297],
  ["f. Prietenii, anturajul", 2285, 351, 378, 493, 305, 261, 497],
  ["g. Influența părinților", 1903, 276, 336, 387, 253, 226, 425],
  ["h. Sugestiile / recomandările dirigintelui", 395, 45, 63, 89, 48, 57, 93],
  ["i. Sugestiile / recomandările profesorului consilier școlar", 337, 37, 76, 83, 41, 32, 68],
  ["j. Recomandările altora", 2250, 329, 399, 457, 298, 274, 493],
  ["k. Profilul ales este necesar pentru a practica profesia pe care doresc să o urmeze", 2116, 261, 376, 430, 305, 255, 489],
  ["l. Profilul ales îi va ajuta să practice o meserie cerută pe piața muncii", 915, 111, 158, 180, 116, 136, 214],
  ["m. Rezultatele școlare obținute în gimnaziu", 1352, 170, 231, 262, 202, 181, 306]
]}
    classNames={["w-2/5","text-right","text-right","text-right","text-right","text-right","text-right","text-right"]}
    pillColors={{}}
  />

</Col>
</Cols>

## 4. Ce i-a influențat cel mai mult pe elevi în alegerea făcută?
<Cols variant="eindtoets">
<Col>
<GraphRow100
   title="a. Aptitudinile personale"
   score={91.24}
   scoreDisplay={4562}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="b. Prestigiul școlii"
   score={51.14}
   scoreDisplay={2557}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="c. Apropierea școlii de casă"
   score={66.48}
   scoreDisplay={3324}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="d. Perspectiva financiară oferită de domeniul profesional ales pentru care se pregătesc"
   score={25}
   scoreDisplay={1250}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="e. Oportunitățile de pe piața muncii"
   score={24.6}
   scoreDisplay={1230}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="f. Prietenii, anturajul"
   score={45.7}
   scoreDisplay={2285}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="g. Influența părinților"
   score={38.06}
   scoreDisplay={1903}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="h. Sugestiile / recomandările dirigintelui"
   score={7.9}
   scoreDisplay={395}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="i. Sugestiile / recomandările profesorului consilier școlar"
   score={6.74}
   scoreDisplay={337}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="j. Recomandările altora"
   score={45}
   scoreDisplay={2250}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="k. Profilul ales este necesar pentru a practica profesia pe care doresc să o urmeze"
   score={42.32}
   scoreDisplay={2116}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="l. Profilul ales îi va ajuta să practice o meserie cerută pe piața muncii"
   score={18.3}
   scoreDisplay={915}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="m. Rezultatele școlare obținute în gimnaziu"
   score={27.04}
   scoreDisplay={1352}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
</Col>
</Cols>
</Page>


<Page
	product="Chestionar OSP București"
	title="Întrebarea 5"
	icon="page-stack">

# 5. Cu cine s-au consultat elevii în alegerea școlii pe care doresc să o urmeze?
<Cols variant="eindtoets">
<Col>

<Table
  
    headers={["Opțiuni exprimate","Total B","Din S1","Din S2","Din S3","Din S4","Din S5","Din S6"]}
    data={[
  ["a. Familia", 7688, 1051, 1297, 1506, 1058, 926, 1850],
  ["b. Dirigintele", 619, 82, 158, 114, 52, 65, 148],
  ["c. Profesorii", 995, 146, 166, 211, 127, 107, 238],
  ["d. Prietenii", 3498, 503, 571, 738, 464, 394, 828],
  ["e. Consilierul școlar", 269, 40, 105, 42, 26, 10, 46],
  ["f. Alții", 807, 134, 142, 147, 104, 83, 197],
  ["g. Am decis singur", 3606, 484, 625, 710, 492, 464, 831]
]}
    classNames={["w-2/5","text-right","text-right","text-right","text-right","text-right","text-right","text-right"]}
    pillColors={{}}
  />

</Col>
</Cols>

## 5. Cu cine s-au consultat elevii în alegerea școlii pe care doresc să o urmeze?
<Cols variant="eindtoets">
<Col>
<GraphRow100
   title="a. Familia"
   score={96.1}
   scoreDisplay={7688}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="b. Dirigintele"
   score={7.7375}
   scoreDisplay={619}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="c. Profesorii"
   score={12.4375}
   scoreDisplay={995}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="d. Prietenii"
   score={43.725}
   scoreDisplay={3498}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="e. Consilierul școlar"
   score={3.3625}
   scoreDisplay={269}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="f. Alții"
   score={10.0875}
   scoreDisplay={807}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="g. Am decis singur"
   score={45.075}
   scoreDisplay={3606}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
</Col>
</Cols>
</Page>


<Page
	product="Chestionar OSP București"
	title="Întrebarea 8"
	icon="page-stack">

# 8. În ce domeniu de activitate ar prefera elevii să lucreze?
<Cols variant="eindtoets">
<Col>

<Table
  
    headers={["Opțiuni exprimate","Total B","Din S1","Din S2","Din S3","Din S4","Din S5","Din S6"]}
    data={[
  ["a. Justiție", 1415, 210, 235, 289, 198, 173, 310],
  ["b. Artă", 1123, 162, 199, 247, 142, 122, 251],
  ["c. Arhitectură", 1303, 199, 225, 262, 158, 156, 303],
  ["d. Agricultură", 107, 16, 16, 23, 12, 12, 28],
  ["e. Administrarea afacerilor", 1493, 226, 246, 301, 213, 170, 337],
  ["f. Inginerie și noile tehnologii (robotică, nanotehnologie, biotehnologie etc.)", 1214, 166, 219, 241, 170, 137, 281],
  ["g. Turism", 474, 52, 71, 88, 71, 65, 127],
  ["h. Armată", 691, 81, 105, 147, 96, 123, 139],
  ["i. Mass-media", 748, 104, 124, 156, 107, 78, 179],
  ["j. Educație / învățământ", 428, 47, 73, 94, 48, 48, 118],
  ["k. Cercetare", 337, 61, 62, 67, 39, 41, 67],
  ["l. Medicină", 1607, 262, 269, 322, 218, 186, 350],
  ["m. Teologie", 62, 8, 11, 9, 7, 9, 18],
  ["n. Informatică / computer science", 1391, 208, 222, 254, 192, 180, 335],
  ["o. Publicitate", 258, 37, 44, 46, 35, 40, 56],
  ["p. Ecologie, protecția mediului", 81, 11, 17, 12, 7, 8, 26],
  ["q. Curierat", 45, 2, 9, 10, 6, 11, 7],
  ["r. Transport", 150, 17, 28, 29, 25, 15, 36],
  ["s. Sport", 1038, 134, 180, 205, 145, 143, 231],
  ["ș. Politică și relații internaționale", 293, 50, 51, 53, 39, 32, 68],
  ["t. Psihologie / dezvoltare personală", 1067, 139, 173, 218, 132, 133, 272],
  ["ț. Finanțe - bănci", 439, 68, 88, 82, 70, 55, 76],
  ["u. Asistență socială", 111, 12, 19, 25, 17, 14, 24],
  ["v. Poliție", 649, 69, 123, 117, 83, 106, 151],
  ["w. Comerț", 287, 35, 67, 62, 39, 30, 54],
  ["x. Altele", 1236, 187, 195, 229, 171, 176, 278],
  ["y. Nu știu / Nu răspund", 953, 119, 169, 201, 116, 122, 226]
]}
    classNames={["w-2/5","text-right","text-right","text-right","text-right","text-right","text-right","text-right"]}
    pillColors={{}}
  />

</Col>
</Cols>

## 8. În ce domeniu de activitate ar prefera elevii să lucreze?
<Cols variant="eindtoets">
<Col>
<GraphRow100
   title="a. Justiție"
   score={70.75}
   scoreDisplay={1415}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="b. Artă"
   score={56.15}
   scoreDisplay={1123}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="c. Arhitectură"
   score={65.15}
   scoreDisplay={1303}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="d. Agricultură"
   score={5.35}
   scoreDisplay={107}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="e. Administrarea afacerilor"
   score={74.65}
   scoreDisplay={1493}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="f. Inginerie și noile tehnologii (robotică, nanotehnologie, biotehnologie etc.)"
   score={60.7}
   scoreDisplay={1214}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="g. Turism"
   score={23.7}
   scoreDisplay={474}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="h. Armată"
   score={34.55}
   scoreDisplay={691}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="i. Mass-media"
   score={37.4}
   scoreDisplay={748}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="j. Educație / învățământ"
   score={21.4}
   scoreDisplay={428}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="k. Cercetare"
   score={16.85}
   scoreDisplay={337}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="l. Medicină"
   score={80.35}
   scoreDisplay={1607}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="m. Teologie"
   score={3.1}
   scoreDisplay={62}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="n. Informatică / computer science"
   score={69.55}
   scoreDisplay={1391}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="o. Publicitate"
   score={12.9}
   scoreDisplay={258}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="p. Ecologie, protecția mediului"
   score={4.05}
   scoreDisplay={81}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="q. Curierat"
   score={2.25}
   scoreDisplay={45}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="r. Transport"
   score={7.5}
   scoreDisplay={150}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="s. Sport"
   score={51.9}
   scoreDisplay={1038}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="ș. Politică și relații internaționale"
   score={14.65}
   scoreDisplay={293}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="t. Psihologie / dezvoltare personală"
   score={53.35}
   scoreDisplay={1067}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="ț. Finanțe - bănci"
   score={21.95}
   scoreDisplay={439}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="u. Asistență socială"
   score={5.55}
   scoreDisplay={111}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="v. Poliție"
   score={32.45}
   scoreDisplay={649}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="w. Comerț"
   score={14.35}
   scoreDisplay={287}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="x. Altele"
   score={61.8}
   scoreDisplay={1236}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
<GraphRow100
   title="y. Nu știu / Nu răspund"
   score={47.65}
   scoreDisplay={953}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight="font-normal"
   textSize="text-2xs"
  />
</Col>
</Cols>
</Page>

<Page
	product="Chestionar OSP București"
	title="Specializari"
	icon="page-stack">

<Cols variant="eindtoets">
<Col>

<Table
  
    headers={["Opțiuni exprimate","Total B","Din S1","Din S2","Din S3","Din S4","Din S5","Din S6"]}
    data={[
  ["A. Liceu - Filiera teoretică", 7439, 1074, 1243, 1473, 998, 923, 1728],
  ["Real", 4635, 742, 766, 896, 628, 520, 1083],
  ["1. Matematică-Informatică", 1726, 262, 263, 310, 251, 185, 455],
  ["2. Matematică-Informatică - bilingv - limba engleză", 861, 153, 153, 165, 101, 102, 187],
  ["3. Matematică-Informatică - bilingv - limba franceză", 43, 8, 13, 5, 4, 4, 9],
  ["4. Matematică-Informatică - bilingv - limba germană", 64, 21, 8, 13, 7, 5, 10],
  ["5. Matematică-Informatică - bilingv - limba italiană", 19, 1, 1, 14, 1, 1, 1],
  ["6. Matematică-Informatică - bilingv - limba spaniolă", 36, 5, 4, 4, 8, 6, 9],
  ["7. Matematică-Informatică - intensiv informatică", 205, 26, 40, 34, 23, 23, 59],
  ["8. Matematică-Informatică - intensiv limba engleză", 153, 29, 20, 30, 25, 16, 33],
  ["9. Matematică-Informatică - matern limba germană", 25, 10, 4, 5, 1, 2, 3],
  ["10. Matematică-Informatică - cu predare a limbii materne bulgară", 0, 0, 0, 0, 0, 0, 0],
  ["11. Matematică-Informatică - clase speciale, matern limba germană", 29, 8, 6, 3, 4, 4, 4],
  ["12. Științe ale naturii", 887, 119, 151, 193, 129, 101, 194],
  ["13. Științe ale naturii - bilingv limba engleză", 453, 83, 84, 85, 53, 59, 89],
  ["14. Științe ale naturii - bilingv limba italiană", 18, 2, 2, 4, 5, 0, 5],
  ["15. Științe ale naturii - intensiv limba engleză", 106, 12, 17, 28, 14, 11, 24],
  ["16. Științe ale naturii - matern limba italiană", 7, 3, 0, 2, 2, 0, 0],
  ["17. Științe ale naturii - matern limba maghiară", 3, 0, 0, 1, 0, 1, 1],
  ["Uman", 2804, 332, 477, 577, 370, 403, 645],
  ["18. Filologie", 833, 89, 156, 166, 109, 118, 195],
  ["19. Filologie - bilingv - limba engleză", 651, 74, 113, 148, 70, 98, 148],
  ["20. Filologie - bilingv - limba franceză", 26, 2, 8, 3, 6, 2, 5],
  ["21. Filologie - bilingv - limba germană", 37, 11, 7, 10, 2, 2, 5],
  ["22. Filologie - bilingv - limba italiană", 30, 1, 2, 20, 0, 3, 4],
  ["23. Filologie - bilingv - limba portugheză", 1, 0, 1, 0, 0, 0, 0],
  ["24. Filologie - bilingv - limba spaniolă", 51, 8, 11, 10, 6, 2, 14],
  ["25. Filologie - intensiv limba engleză", 129, 17, 22, 27, 21, 16, 26],
  ["26. Filologie - intensiv limba franceză", 7, 1, 2, 0, 1, 0, 3],
  ["27. Filologie - intensiv limba japoneză", 25, 2, 2, 6, 2, 8, 5],
  ["28. Filologie - intensiv limba chineză", 2, 0, 0, 0, 1, 0, 1],
  ["29. Filologie - cu predare a limbii materne bulgară", 0, 0, 0, 0, 0, 0, 0],
  ["30. Filologie - matern limba germană", 16, 5, 3, 3, 1, 1, 3],
  ["31. Filologie - cu predare a limbii materne neogreacă", 2, 0, 0, 0, 0, 0, 2],
  ["32. Filologie - cu predare a limbii materne rromani", 12, 1, 1, 4, 0, 2, 4],
  ["33. Filologie - cu predare a limbii materne rusă", 6, 0, 3, 0, 1, 0, 2],
  ["34. Științe sociale", 593, 63, 86, 105, 96, 107, 136],
  ["35. Științe sociale - matern limba germană", 14, 4, 2, 5, 2, 1, 0],
  ["36. Științe sociale - intensiv limba engleză", 159, 26, 21, 30, 23, 19, 40],
  ["37. Științe sociale - bilingv limba engleză", 205, 28, 37, 38, 27, 24, 51],
  ["38. Științe sociale - bilingv limba germană", 5, 0, 0, 2, 2, 0, 1],
  ["B. Liceu - Filiera tehnologică", 526, 54, 109, 106, 64, 58, 135],
  ["Tehnic / Chimie industrială", 7, 1, 0, 3, 0, 2, 1],
  ["39. Tehnician în chimie industrială", 7, 1, 0, 3, 0, 2, 1],
  ["Tehnic / Construcții, instalații și lucrări publice", 30, 2, 5, 7, 4, 3, 9],
  ["40. Tehnician desenator pentru construcții și instalații", 15, 2, 3, 3, 2, 1, 4],
  ["41. Tehnician în construcții și lucrări publice", 11, 0, 2, 2, 2, 1, 4],
  ["42. Tehnician instalator pentru construcții", 4, 0, 0, 2, 0, 1, 1],
  ["Tehnic / Electric", 36, 2, 7, 9, 6, 1, 11],
  ["43. Tehnician electrician electronist auto", 21, 2, 4, 2, 4, 1, 8],
  ["44. Tehnician electrotehnist", 2, 0, 0, 2, 0, 0, 0],
  ["45. Tehnician metrolog", 1, 0, 0, 0, 1, 0, 0],
  ["46. Tehnician energetician", 1, 0, 0, 1, 0, 0, 0],
  ["47. Tehnician în instalații electrice", 11, 0, 3, 4, 1, 0, 3],
  ["Tehnic / Electromecanică", 23, 4, 5, 3, 1, 2, 8],
  ["48. Tehnician aviație", 15, 3, 4, 3, 1, 1, 3],
  ["49. Tehnician electromecanic", 4, 0, 1, 0, 0, 1, 2],
  ["50. Tehnician instalații de bord (avion)", 4, 1, 0, 0, 0, 0, 3],
  ["Tehnic / Electronică automatizări", 7, 0, 1, 1, 0, 0, 5],
  ["51. Tehnician de telecomunicații - intensiv limba engleză", 2, 0, 0, 1, 0, 0, 1],
  ["52. Tehnician în automatizări", 2, 0, 0, 0, 0, 0, 2],
  ["53. Tehnician operator tehnică de calcul", 1, 0, 0, 0, 0, 0, 1],
  ["54. Tehnician operator roboți industriali", 2, 0, 1, 0, 0, 0, 1],
  ["Tehnic / Fabricarea produselor din lemn", 7, 2, 3, 1, 0, 1, 0],
  ["55. Tehnician designer mobilă și amenajări interioare", 7, 2, 3, 1, 0, 1, 0],
  ["Tehnic / Industrie textilă și pielărie", 11, 0, 1, 4, 0, 1, 5],
  ["56. Tehnician designer vestimentar", 11, 0, 1, 4, 0, 1, 5],
  ["Tehnic / Mecanică", 55, 11, 12, 11, 2, 6, 13],
  ["57. Tehnician mecanic pentru întreținere și reparații", 28, 7, 6, 3, 1, 5, 6],
  ["58. Tehnician mecatronist", 1, 1, 0, 0, 0, 0, 0],
  ["59. Tehnician prelucrări pe mașini cu comandă numerică", 10, 3, 2, 4, 0, 0, 1],
  ["60. Tehnician prelucrări mecanice", 3, 0, 2, 1, 0, 0, 0],
  ["61. Tehnician proiectant CAD", 4, 0, 0, 0, 1, 0, 3],
  ["62. Tehnician transporturi", 9, 0, 2, 3, 0, 1, 3],
  ["Tehnic / Producție media", 23, 3, 1, 3, 2, 4, 10],
  ["63. Tehnician multimedia", 6, 0, 0, 0, 2, 1, 3],
  ["64. Tehnician operator procesare text / imagine", 1, 0, 0, 0, 0, 1, 0],
  ["65. Tehnician producție film și televiziune", 7, 1, 0, 1, 0, 1, 4],
  ["66. Tehnician producție film și televiziune, intensiv limba engleză", 1, 0, 0, 0, 0, 0, 1],
  ["67. Tehnician audio - video", 8, 2, 1, 2, 0, 1, 2],
  ["Tehnic / Tehnici poligrafice", 0, 0, 0, 0, 0, 0, 0],
  ["68. Tehnician poligraf", 0, 0, 0, 0, 0, 0, 0],
  ["Resurse naturale și protecția mediului / Agricultură", 12, 1, 1, 1, 1, 3, 5],
  ["69. Tehnician veterinar", 6, 1, 1, 0, 1, 1, 2],
  ["70. Tehnician în agroturism", 4, 0, 0, 1, 0, 2, 1],
  ["71. Tehnician pentru animale de companie", 2, 0, 0, 0, 0, 0, 2],
  ["Resurse naturale și protecția mediului / Industrie alimentară", 4, 0, 0, 0, 0, 3, 1],
  ["72. Tehnician analize produse alimentare", 1, 0, 0, 0, 0, 0, 1],
  ["73. Tehnician analize produse alimentare - intensiv limba engleză", 0, 0, 0, 0, 0, 0, 0],
  ["74. Tehnician în industria alimentară", 2, 0, 0, 0, 0, 2, 0],
  ["75. Tehnician în morărit, panificație și produse făinoase", 0, 0, 0, 0, 0, 0, 0],
  ["76. Tehnician în prelucrarea produselor de origine animală", 1, 0, 0, 0, 0, 1, 0],
  ["Resurse naturale și protecția mediului / Chimie industrială", 1, 1, 0, 0, 0, 0, 0],
  ["77. Tehnician chimist de laborator", 1, 1, 0, 0, 0, 0, 0],
  ["Resurse naturale și protecția mediului / Protecția mediului", 0, 0, 0, 0, 0, 0, 0],
  ["78. Tehnician ecolog și protecția calității mediului", 0, 0, 0, 0, 0, 0, 0],
  ["79. Tehnician ecolog și protecția calității mediului – intensiv limba engleză", 0, 0, 0, 0, 0, 0, 0],
  ["Servicii / Comerț", 10, 0, 3, 3, 0, 1, 3],
  ["80. Tehnician în achiziții și contractări", 5, 0, 2, 1, 0, 1, 1],
  ["81. Tehnician în activități de comerț", 5, 0, 1, 2, 0, 0, 2],
  ["Servicii / Economic", 228, 17, 63, 48, 37, 19, 44],
  ["82. Tehnician în activități de poștă - intensiv limba franceză", 1, 0, 0, 0, 0, 0, 1],
  ["83. Tehnician în activități economice", 154, 13, 45, 26, 29, 11, 30],
  ["84. Tehnician în activități economice - intensiv limba chineză", 5, 1, 1, 1, 0, 1, 1],
  ["85. Tehnician în activități economice - intensiv limba engleză", 52, 2, 12, 17, 7, 6, 8],
  ["86. Tehnician în activități economice - intensiv limba spaniolă", 7, 0, 3, 2, 0, 0, 2],
  ["87. Tehnician în activități economice - intensiv limba italiană", 1, 1, 0, 0, 0, 0, 0],
  ["88. Tehnician în administrație", 8, 0, 2, 2, 1, 1, 2],
  ["Servicii / Estetica și igiena corpului omenesc", 35, 5, 4, 8, 2, 9, 7],
  ["89. Coafor stilist", 35, 5, 4, 8, 2, 9, 7],
  ["Servicii / Turism și alimentație", 37, 5, 3, 4, 9, 3, 13],
  ["90. Organizator banqueting", 4, 0, 0, 0, 1, 1, 2],
  ["91. Organizator banqueting - intensiv limba engleză", 0, 0, 0, 0, 0, 0, 0],
  ["92. Tehnician în gastronomie", 5, 2, 0, 0, 0, 1, 2],
  ["93. Tehnician în gastronomie - intensiv limba engleză", 0, 0, 0, 0, 0, 0, 0],
  ["94. Tehnician în hotelărie", 0, 0, 0, 0, 0, 0, 0],
  ["95. Tehnician în hotelărie - intensiv limba engleză", 0, 0, 0, 0, 0, 0, 0],
  ["96. Tehnician în turism", 17, 2, 2, 2, 6, 1, 4],
  ["97. Tehnician în turism - intensiv limba engleză", 10, 1, 1, 1, 2, 0, 5],
  ["98. Tehnician în turism - intensiv limba franceză", 0, 0, 0, 0, 0, 0, 0],
  ["99. Tehnician în turism - intensiv limba greacă", 0, 0, 0, 0, 0, 0, 0],
  ["100. Tehnician în turism - intensiv limba germană", 1, 0, 0, 1, 0, 0, 0],
  ["C. Liceu – Filiera vocațională", 769, 83, 118, 153, 124, 104, 187],
  ["Arte vizuale", 218, 26, 32, 52, 37, 23, 48],
  ["101. Desenator tehnic pentru arhitectură și design", 165, 17, 24, 37, 31, 18, 38],
  ["102. Tehnician pentru tehnici artistice", 53, 9, 8, 15, 6, 5, 10],
  ["Coregrafie", 13, 1, 3, 2, 1, 2, 4],
  ["103. Balerin / Dansator", 13, 1, 3, 2, 1, 2, 4],
  ["Muzică", 44, 3, 9, 5, 8, 6, 13],
  ["104. Instrumentist", 44, 3, 9, 5, 8, 6, 13],
  ["Pedagogic", 49, 3, 6, 7, 3, 9, 21],
  ["105. Învățător – educatoare", 44, 3, 5, 5, 3, 9, 19],
  ["106. Educator puericultor", 5, 0, 1, 2, 0, 0, 2],
  ["Sportiv", 409, 48, 66, 76, 70, 58, 91],
  ["107. Instructor sportiv", 409, 48, 66, 76, 70, 58, 91],
  ["Teatru", 17, 0, 2, 7, 3, 2, 3],
  ["108. Instructor de teatru", 17, 0, 2, 7, 3, 2, 3],
  ["Teologic", 19, 2, 0, 4, 2, 4, 7],
  ["109. Ghid turism religios", 1, 0, 0, 1, 0, 0, 0],
  ["110. Teologie adventistă", 0, 0, 0, 0, 0, 0, 0],
  ["111. Teologie baptistă", 1, 1, 0, 0, 0, 0, 0],
  ["112. Teologie ortodoxă", 16, 1, 0, 3, 2, 4, 6],
  ["113. Teologie penticostală", 1, 0, 0, 0, 0, 0, 1],
  ["D. Liceu - Învățământ special - Filiera teoretică", 80, 5, 21, 15, 13, 6, 20],
  ["Real", 47, 4, 14, 8, 6, 3, 12],
  ["114. Științe ale naturii", 47, 4, 14, 8, 6, 3, 12],
  ["Umanist", 33, 1, 7, 7, 7, 3, 8],
  ["115. Filologie", 33, 1, 7, 7, 7, 3, 8],
  ["E. Învățământ profesional ", 186, 25, 41, 25, 23, 36, 36],
  ["Chimie industrială", 0, 0, 0, 0, 0, 0, 0],
  ["116. Operator industria de medicamente și produse cosmetice", 0, 0, 0, 0, 0, 0, 0],
  ["Comerț", 17, 3, 3, 3, 2, 1, 5],
  ["117. Comerciant - vânzător", 15, 2, 2, 3, 2, 1, 5],
  ["118. Recepționer - distribuitor", 2, 1, 1, 0, 0, 0, 0],
  ["Construcții, instalații și lucrări publice", 1, 0, 0, 1, 0, 0, 0],
  ["119. Instalator de instalații tehnico-sanitare și de gaze", 1, 0, 0, 1, 0, 0, 0],
  ["120. Instalator de instalații de încălzire centrală", 0, 0, 0, 0, 0, 0, 0],
  ["Electric", 6, 0, 3, 0, 2, 0, 1],
  ["121. Electrician auto", 5, 0, 2, 0, 2, 0, 1],
  ["122. Electrician exploatare centrale, stații și rețele electrice", 0, 0, 0, 0, 0, 0, 0],
  ["123. Electrician exploatare joasă tensiune", 1, 0, 1, 0, 0, 0, 0],
  ["Electromecanică", 1, 0, 1, 0, 0, 0, 0],
  ["124. Frigotehnist", 0, 0, 0, 0, 0, 0, 0],
  ["125. Electromecanic utilaje și instalații comerciale, electrocasnice și din industria alimentară", 1, 0, 1, 0, 0, 0, 0],
  ["Electronică automatizări", 2, 0, 0, 0, 0, 0, 2],
  ["126. Electronist rețele de telecomunicații", 1, 0, 0, 0, 0, 0, 1],
  ["127. Electronist aparate și echipamente", 1, 0, 0, 0, 0, 0, 1],
  ["Industrie alimentară", 4, 0, 2, 0, 1, 1, 0],
  ["128. Brutar - patiser - preparator produse făinoase", 3, 0, 1, 0, 1, 1, 0],
  ["129. Operator în industria zahărului și a produselor zaharoase", 0, 0, 0, 0, 0, 0, 0],
  ["130. Preparator produse din carne și pește", 1, 0, 1, 0, 0, 0, 0],
  ["131. Operator în industria malțului și a berii", 0, 0, 0, 0, 0, 0, 0],
  ["Mecanică", 53, 8, 12, 5, 6, 10, 12],
  ["132. Mecanic auto", 46, 8, 10, 5, 3, 8, 12],
  ["133. Mecanic utilaje și instalații în industrie", 1, 0, 1, 0, 0, 0, 0],
  ["134. Tinichigiu vopsitor auto", 2, 0, 0, 0, 1, 1, 0],
  ["135. Operator la mașini cu comandă numerică", 0, 0, 0, 0, 0, 0, 0],
  ["136. Frezor - rabotor - mortezor", 0, 0, 0, 0, 0, 0, 0],
  ["137. Mecanic aeronave", 2, 0, 0, 0, 2, 0, 0],
  ["138. Mecanic agricol", 2, 0, 1, 0, 0, 1, 0],
  ["139. Mecanic de mecanică fină", 0, 0, 0, 0, 0, 0, 0],
  ["Producție media", 6, 2, 0, 1, 2, 1, 0],
  ["140. Operator producție și exploatare film", 6, 2, 0, 1, 2, 1, 0],
  ["Tehnici poligrafice", 0, 0, 0, 0, 0, 0, 0],
  ["141. Legător", 0, 0, 0, 0, 0, 0, 0],
  ["142. Tipăritor offset", 0, 0, 0, 0, 0, 0, 0],
  ["Turism și alimentație", 45, 4, 10, 7, 5, 12, 7],
  ["143. Bucătar", 25, 4, 5, 5, 3, 6, 2],
  ["144. Ospătar (chelner) vânzător în unități de alimentație", 14, 0, 4, 1, 0, 5, 4],
  ["145. Lucrător hotelier", 5, 0, 1, 1, 1, 1, 1],
  ["146. Cofetar - patiser", 1, 0, 0, 0, 1, 0, 0],
  ["Estetica și igiena corpului omenesc", 51, 8, 10, 8, 5, 11, 9],
  ["147. Frizer - coafor - manichiurist - pedichiurist", 51, 8, 10, 8, 5, 11, 9],
  ["F. Învățământ profesional special", 30, 2, 8, 4, 4, 1, 11],
  ["Construcții, instalații și lucrări publice", 2, 0, 1, 0, 1, 0, 0],
  ["148. Instalator de instalații tehnico-sanitare și de gaze", 1, 0, 1, 0, 0, 0, 0],
  ["149. Zugrav - ipsosar - vopsitor - tapetar", 1, 0, 0, 0, 1, 0, 0],
  ["Agricultură", 2, 0, 1, 0, 0, 0, 1],
  ["150. Horticultor", 0, 0, 0, 0, 0, 0, 0],
  ["151. Agricultor culturi de câmp", 2, 0, 1, 0, 0, 0, 1],
  ["Fabricarea produselor din lemn", 0, 0, 0, 0, 0, 0, 0],
  ["152. Tâmplar universal", 0, 0, 0, 0, 0, 0, 0],
  ["Industrie alimentară", 1, 0, 0, 0, 1, 0, 0],
  ["153. Brutar - patiser - preparator produse făinoase", 0, 0, 0, 0, 0, 0, 0],
  ["154. Preparator produse din carne și pește", 1, 0, 0, 0, 1, 0, 0],
  ["Mecanică", 4, 0, 1, 1, 0, 0, 2],
  ["155. Constructor - montator de structuri metalice", 4, 0, 1, 1, 0, 0, 2],
  ["Tehnici poligrafice", 2, 0, 1, 0, 0, 0, 1],
  ["156. Tipăritor offset", 2, 0, 1, 0, 0, 0, 1],
  ["Turism și alimentație", 18, 2, 3, 3, 2, 1, 7],
  ["157. Bucătar", 13, 2, 2, 3, 1, 1, 4],
  ["158. Lucrător hotelier", 5, 0, 1, 0, 1, 0, 3],
  ["Industrie textilă şi pielărie", 1, 0, 1, 0, 0, 0, 0],
  ["159. Confecționer produse textile", 1, 0, 1, 0, 0, 0, 0],
  ["G. Altele", 822, 80, 157, 193, 114, 104, 174],
  ["160. Nu știu încă", 822, 80, 157, 193, 114, 104, 174]
]}
    classNames={["w-2/5","text-right","text-right","text-right","text-right","text-right","text-right","text-right"]}
    pillColors={{}}
  />

</Col>
</Cols>
</Page>


```



