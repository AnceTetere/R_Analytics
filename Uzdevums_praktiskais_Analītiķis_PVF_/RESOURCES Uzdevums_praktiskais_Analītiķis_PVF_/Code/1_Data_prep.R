library(dplyr)
library(ggplot2)

dati <- read.csv("Dati.csv", header = TRUE, stringsAsFactors = TRUE)
head(dati)

# Data exploration
nrow(dati)
dati1 <- dati
nrow(dati1)

# Tiek parbaudita un parvardota kolonna
# 1. kolonna: Darbinieka numurs
nrow(dati1) == sum(!is.na(dati1$Darbinieka.identifikators))
dati1$employeeID <- as.character(dati1$Darbinieka.identifikators)
nrow(dati1) == sum(dati1$employeeID == dati1$Darbinieka.identifikators)
head(dati1)
tail(dati1)

typeof(dati1$employeeID)


# 2. kolonna: Gads
nrow(dati1) == sum(!is.na(dati1[, 1]))
dati1$year <- as.character(dati1[, 1])
head(dati1)
tail(dati1)

sum(as.character(dati1[, 1]) == dati1$year)
typeof(dati1$year)


# 3. kolonna: Funkciju grupas
nrow(dati1) == sum(!is.na(dati1[, 2]))
dati1$function_group <- as.character(dati1[, 2])
head(dati1)
tail(dati1)

sum(as.character(dati1[, 2]) == dati1$function_group)
typeof(dati1$function_group)


# 4. kolonna: Planotas darba dienas
nrow(dati1) == sum(!is.na(dati1[, 5]))
dati1$planned_work_days <- dati1[, 5]
head(dati1)
tail(dati1)

sum(dati1[, 5] == dati1$planned_work_days)
typeof(dati1$planned_work_days)


# 5. kolonna: Brivdienas
nrow(dati1) == sum(!is.na(dati1[, 6]))
dati1$holidays <- dati1[, 6]
head(dati1)
tail(dati1)

sum(dati1[, 6] == dati1$holidays)
typeof(dati1$planned_work_days)


# 6. kolonna: Atvalinajuma dienas - vacation_days
nrow(dati1) == sum(!is.na(dati1[, 7]))
dati1$vacation_days <- dati1[, 7]
head(dati1)
tail(dati1)

sum(dati1[, 7] == dati1$vacation_days)
typeof(dati1$vacation_days)


# 7. kolonna: Citas apmaksatas prombutnes - paid_days_off
nrow(dati1) == sum(!is.na(dati1[, 8]))
dati1$paid_days_off <- dati1[, 8]
head(dati1)
tail(dati1)

sum(dati1[, 8] == dati1$paid_days_off)
typeof(dati1$paid_days_off)


# 8. kolonna: Slimibas lapas A dienas - sick_leave_A
nrow(dati1) == sum(!is.na(dati1[, 9]))
dati1$sick_leave_A <- dati1[, 9]
head(dati1)
tail(dati1)

sum(dati1[, 9] == dati1$sick_leave_A)
typeof(dati1$sick_leave_A)


# 9. kolonna: Slimibas lapas B dienas - sick_leave_B
nrow(dati1) == sum(!is.na(dati1[, 10]))
dati1$sick_leave_B <- dati1[, 10]
head(dati1)
tail(dati1)

sum(dati1[, 10] == dati1$sick_leave_B)
typeof(dati1$sick_leave_B)

# 10. kolonna: Citas slimibas lapas - sick_leave_other
nrow(dati1) == sum(!is.na(dati1[, 11]))
dati1$sick_leave_other <- dati1[, 11]
head(dati1)
tail(dati1)

sum(dati1[, 11] == dati1$sick_leave_other)
typeof(dati1$sick_leave_other)

# 11. kolonna: Kopa atvalinajumi - vacation_total
nrow(dati1) == sum(!is.na(dati1[, 12]))
dati1$vacation_total <- dati1[, 12]
head(dati1)
tail(dati1)

sum(dati1[, 12] == dati1$vacation_total)
sum(dati1$vacation_total == (dati1$holidays + dati1$vacation_days + dati1$paid_days_off))
typeof(dati1$vacation_total)


# 12. kolonna: Kopa slimibas lapas - sick_leave_total
nrow(dati1) == sum(!is.na(dati1[, 13]))
dati1$sick_leave_total <- dati1[, 13]
head(dati1)
tail(dati1)

sum(dati1[, 13] == dati1$sick_leave_total)
sum(
  dati1$sick_leave_total == (
    dati1$sick_leave_A + dati1$sick_leave_B + dati1$sick_leave_other
  )
)
typeof(dati1$sick_leave_total)


# 13. kolonna: Atvalinajuma dienu ipatsvars, %  - vacation_proportion_percentage
dati1$vacation_proportion_percentage = round(((
  dati1$vacation_days / dati1$planned_work_days
) * 100), digits = 2)
nrow(dati1) == sum(!is.na(dati1[, "vacation_proportion_percentage"]))
head(dati1)
tail(dati1)

length(dati1$vacation_proportion_percentage)
typeof(dati1$vacation_proportion_percentage)


# 14. kolonna: Slimibas dienu ipatsvars, % - sickLeave_proportion_percentage
dati1$sickLeave_proportion_percentage = round(((
  dati1$sick_leave_total / dati1$planned_work_days
) * 100), digits = 2)
nrow(dati1) == sum(!is.na(dati1[, "sickLeave_proportion_percentage"]))

head(dati1)
tail(dati1)

length(dati1$sickLeave_proportion_percentage)
typeof(dati1$sickLeave_proportion_percentage)



dati2 <-
  subset(
    dati1,
    select = c(
      year,
      function_group,
      employeeID,
      planned_work_days,
      holidays,
      vacation_days,
      paid_days_off,
      vacation_total,
      vacation_proportion_percentage,
      sick_leave_A,
      sick_leave_B,
      sick_leave_other,
      sick_leave_total,
      sickLeave_proportion_percentage
    )
  )
head(dati2)

sum(dati2$year == dati1$year) == sum(
  dati2$function_group == dati1$Funkcijas &
    dati2$function_group == dati1$function_group
) &
  sum(
    dati2$function_group == dati1$Funkcijas &
      dati2$function_group == dati1$function_group
  ) == sum(
    dati2$employeeID == dati1$employeeID &
      dati2$employeeID == dati1$Darbinieka.identifikators
  ) &
  sum(
    dati2$employeeID == dati1$employeeID &
      dati2$employeeID == dati1$Darbinieka.identifikators
  ) == sum(
    dati2$planned_work_days == dati1$planned_work_days &
      dati2$planned_work_days == dati1$Pl�.not�.s.darba.dienas
  ) &
  sum(
    dati2$planned_work_days == dati1$planned_work_days &
      dati2$planned_work_days == dati1$Pl�.not�.s.darba.dienas
  ) == sum(dati2$holidays == dati1$holidays &
             dati2$holidays == dati1$Br�.vdienas) &
  sum(dati2$holidays == dati1$holidays &
        dati2$holidays == dati1$Br�.vdienas) == sum(
          dati2$vacation_days == dati1$vacation_days &
            dati2$vacation_days == dati1$Atva�.in�.juma.dienas
        ) &
  sum(
    dati2$vacation_days == dati1$vacation_days &
      dati2$vacation_days == dati1$Atva�.in�.juma.dienas
  ) == sum(
    dati2$paid_days_off == dati1$paid_days_off &
      dati2$paid_days_off == dati1$Citas.apmaks�.t�.s.promb�.tnes
  ) &
  sum(
    dati2$paid_days_off == dati1$paid_days_off &
      dati2$paid_days_off == dati1$Citas.apmaks�.t�.s.promb�.tnes
  ) == sum(
    dati2$sick_leave_A == dati1$sick_leave_A &
      dati2$sick_leave_A == dati1$Slim�.bas.lapas.A.dienas
  ) &
  sum(
    dati2$sick_leave_A == dati1$sick_leave_A &
      dati2$sick_leave_A == dati1$Slim�.bas.lapas.A.dienas
  ) == sum(
    dati2$sick_leave_B == dati1$sick_leave_B &
      dati2$sick_leave_B == dati1$Slim�.bas.lapas.B.dienas
  ) &
  sum(
    dati2$sick_leave_B == dati1$sick_leave_B &
      dati2$sick_leave_B == dati1$Slim�.bas.lapas.B.dienas
  ) == sum(
    dati2$sick_leave_other == dati1$sick_leave_other &
      dati2$sick_leave_other == dati1$Citas.slim�.bas.lapas
  ) &
  sum(
    dati2$sick_leave_other == dati1$sick_leave_other &
      dati2$sick_leave_other == dati1$Citas.slim�.bas.lapas
  ) == sum(
    dati2$vacation_total == dati1$vacation_total &
      dati2$vacation_total == dati1$Kop�..atva�.in�.jumi
  ) &
  sum(
    dati2$vacation_total == dati1$vacation_total &
      dati2$vacation_total == dati1$Kop�..atva�.in�.jumi
  ) == sum(
    dati2$sick_leave_total == dati1$sick_leave_total &
      dati2$sick_leave_total == dati1$Kop�..slim.lapas
  ) &
  sum(
    dati2$sick_leave_total == dati1$sick_leave_total &
      dati2$sick_leave_total == dati1$Kop�..slim.lapas
  ) == sum(dati2$vacation_proportion_percentage == dati1$vacation_proportion_percentage) &
  sum(dati2$vacation_proportion_percentage == dati1$vacation_proportion_percentage) == sum(dati2$sickLeave_proportion_percentage == dati1$sickLeave_proportion_percentage)

write.csv(dati2, "Parvardota_tabula_dati2.csv", row.names = FALSE)
