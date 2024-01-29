--Opening Databases

SELECT *
FROM [Portfolio Project LGBTQ+ Animated Shows].dbo.['20220601-LGBTQ-cartoons-series-$']


SELECT *
FROM [Portfolio Project LGBTQ+ Animated Shows].dbo.['20220601-LGBTQ-character-demogr$']


SELECT *
FROM [Portfolio Project LGBTQ+ Animated Shows].dbo.['trans-characters-in-youth-carto$']


--Joining Character Demographics

SELECT *
FROM [Portfolio Project LGBTQ+ Animated Shows].dbo.['20220601-LGBTQ-cartoons-series-$'] s
INNER JOIN [Portfolio Project LGBTQ+ Animated Shows].dbo.['20220601-LGBTQ-character-demogr$'] d
	on d.show_title = s.show_title


--Counting Representation by Platform

SELECT COUNT(Distinct network) as Network#
FROM [Portfolio Project LGBTQ+ Animated Shows].dbo.['20220601-LGBTQ-cartoons-series-$'] s
 JOIN [Portfolio Project LGBTQ+ Animated Shows].dbo.['20220601-LGBTQ-character-demogr$'] d
	on d.show_title = s.show_title



--Number of Shows with Representation

SELECT COUNT(Distinct s.show_title) as ShowRepresentation#
FROM [Portfolio Project LGBTQ+ Animated Shows].dbo.['20220601-LGBTQ-cartoons-series-$'] s
INNER JOIN [Portfolio Project LGBTQ+ Animated Shows].dbo.['20220601-LGBTQ-character-demogr$'] d
	on d.show_title = s.show_title


--Adding Third Join with Trans Dataset

SELECT t.show,t.character,
t.representation,t.gender,t.platform, d.orientation,d.role
FROM ['trans-characters-in-youth-carto$'] t 
LEFT JOIN ['20220601-LGBTQ-character-demogr$'] d
	on d.character_name = t.character
LEFT JOIN ['20220601-LGBTQ-cartoons-series-$'] s
	on d.show_title = s.show_title 
GROUP BY t.show,t.character,t.representation,t.gender,t.platform,d.orientation,d.role


--Showing Platforms

SELECT ['trans-characters-in-youth-carto$'].platform
FROM ['trans-characters-in-youth-carto$']
LEFT JOIN ['20220601-LGBTQ-character-demogr$'] 
	on ['20220601-LGBTQ-character-demogr$'].character_name = ['trans-characters-in-youth-carto$'].character
LEFT JOIN ['20220601-LGBTQ-cartoons-series-$'] 
	on ['20220601-LGBTQ-character-demogr$'].show_title = ['20220601-LGBTQ-cartoons-series-$'].show_title
GROUP BY ['trans-characters-in-youth-carto$'].platform


--Ordered By Show Title
SELECT ['trans-characters-in-youth-carto$'].show, ['trans-characters-in-youth-carto$'].character,
['trans-characters-in-youth-carto$'].representation,['trans-characters-in-youth-carto$'].gender,
['trans-characters-in-youth-carto$'].platform
FROM ['trans-characters-in-youth-carto$']
LEFT JOIN ['20220601-LGBTQ-character-demogr$'] 
	on ['20220601-LGBTQ-character-demogr$'].character_name = ['trans-characters-in-youth-carto$'].character
LEFT JOIN ['20220601-LGBTQ-cartoons-series-$'] 
	on ['20220601-LGBTQ-character-demogr$'].show_title = ['20220601-LGBTQ-cartoons-series-$'].show_title
ORDER BY show


--Show Number of Distinct Platforms for Joined Data

SELECT COUNT(DISTINCT platform)
FROM ['trans-characters-in-youth-carto$'] t 
LEFT JOIN ['20220601-LGBTQ-character-demogr$'] d
	on d.character_name = t.character
LEFT JOIN ['20220601-LGBTQ-cartoons-series-$'] s
	on d.show_title = s.show_title 


--Number of Shows on NETFLIX

SELECT COUNT(Distinct s.show_title) as NETFLIX#
FROM ['trans-characters-in-youth-carto$'] t
LEFT JOIN ['20220601-LGBTQ-character-demogr$'] d
	on d.character_name = t.character
LEFT JOIN ['20220601-LGBTQ-cartoons-series-$'] s
	on d.show_title = s.show_title 
WHERE platform like '%Netflix%'


--Number of Shows That Appear on Disney Channel and Another Channel

SELECT COUNT(Distinct s.show_title) as DISNEY#
FROM ['trans-characters-in-youth-carto$'] t
LEFT JOIN ['20220601-LGBTQ-character-demogr$'] d
	on d.character_name = t.character
LEFT JOIN ['20220601-LGBTQ-cartoons-series-$'] s
	on d.show_title = s.show_title 
WHERE platform like '%Disney Channel%'


--Number of Shows that Only Appear on Disney Channel

SELECT COUNT(Distinct s.show_title) as DISNEY#
FROM ['trans-characters-in-youth-carto$'] t
LEFT JOIN ['20220601-LGBTQ-character-demogr$'] d
	on d.character_name = t.character
LEFT JOIN ['20220601-LGBTQ-cartoons-series-$'] s
	on d.show_title = s.show_title 
WHERE platform like 'Disney Channel'


--Total of Shows That Appear on Disney

SELECT COUNT(Distinct s.show_title) as DISNEY#
FROM ['trans-characters-in-youth-carto$'] t
LEFT JOIN ['20220601-LGBTQ-character-demogr$'] d
	on d.character_name = t.character
LEFT JOIN ['20220601-LGBTQ-cartoons-series-$'] s
	on d.show_title = s.show_title 
WHERE platform like '%Disney%'


