-- Quick look of dataset
select * 
from portfolioproject..fb

-- Age_count
Select age, count(age) as age_count
from portfolioproject..fb
group by age

-- gender_count
Select gender, count(gender) as gender_count
from portfolioproject..fb
group by gender

-- converting campaign_id to a character value by assigning a new column
alter table portfolioproject..fb
add xyz_campaign_id nvarchar (255)

update portfolioproject..fb
set xyz_campaign_id ='campaign_a'
where campaign_id=916

update portfolioproject..fb
set xyz_campaign_id ='campaign_b'
where campaign_id=936

update portfolioproject..fb
set xyz_campaign_id ='campaign_c'
where campaign_id=1178

--campaign_id-wise_approved_conversion 
Select xyz_campaign_id, sum(approved_conversion) as approved_conversion
from portfolioproject..fb
group by xyz_campaign_id

--campaign_id-wise_total_conversion 
Select xyz_campaign_id, sum(total_conversion) as total_conversion
from portfolioproject..fb
group by xyz_campaign_id

--Gender-wise_total_spent
Select gender, round(sum(spent),2) as spent
from portfolioproject..fb
group by gender

--Gender-wise_total_impression
Select Gender, sum(impressions) as impressions
from portfolioproject..fb
group by gender

--Age-wise_total_spent
Select age, round(sum(spent),2) as spent
from portfolioproject..fb
group by age

--Age-wise_total_impressions
Select age, sum(impressions) as impressions
from portfolioproject..fb
group by age

--cost_per_click_of_campaign
Select xyz_campaign_id, sum(clicks) as click, round((sum(spent)/sum(clicks)),3) as cost_per_click
from portfolioproject..fb
group by xyz_campaign_id

--cost_per_connversion_on_campaign
Select xyz_campaign_id, sum(total_conversion) as total_conversion, round((sum(spent)/sum(total_conversion)),3) as cost_per_conversion
from portfolioproject..fb
group by xyz_campaign_id

--age-wise_total_interest
Select age, sum(interest1) as interest1, sum(interest2) as interest2, sum(interest3) as interest3
from portfolioproject..fb
group by age

--Gender-wise_total_interest
Select gender, sum(interest1) as interest1, sum(interest2) as interest2, sum(interest3) as interest3
from portfolioproject..fb
group by gender

--Percentage_of_total_conversion_to approved conversion
select sum(total_conversion) as total_conversion, sum(approved_conversion) as approved_conversion, round((sum(approved_conversion)*100/sum(total_conversion)),2) as percent_change
from portfolioproject..fb