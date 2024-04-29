library(tidyverse)

## ดูลักษณะข้อมูล
View(diamonds)

## 1. สร้าง Histogram เพื่อดูลักษณะการกระจายของ price
diamonds %>%
  ggplot(aes(price), color = price) +
  geom_histogram(bins = 30, fill = "green") +
  theme_minimal()






## 2. สร้าง Violin เพื่อดูการกระจายและความเบ้
diamonds %>%
  ggplot(aes(cut, price)) +
  geom_violin(scale = "area" , fill = "salmon") +
  theme_minimal()










## 3. สร้าง Bar Chart เพื่อเปรียบเทียบของเพชรแต่ละเกรด
diamonds %>%
  group_by(cut) %>%
  summarise(
    med_price = median(price)
  ) %>%
  ggplot(aes(cut, med_price)) +
  geom_col(fill = "green") +
  theme_minimal()






## 4. สร้าง Scattor Plot เพื่อดูความสัมพันธ์ของ carat กับ price
diamonds %>%
  ggplot(aes(x = carat, y = price, color = price)) +  # ใช้ price เป็นตัวแปรเชิงซ้อน
  geom_point() +
  labs(x = "Carat", y = "Price") +
  geom_rug() +
  scale_color_gradient(low = "green", high = "salmon") +  # กำหนดสีจากน้อยไปมาก
  theme_minimal()







## 5. สร้าง Bubble Chart ของ cut กับ color
diamonds %>%
  ggplot(aes(x = cut, y = color)) +
  geom_count(color = "salmon") +
  theme_minimal()






