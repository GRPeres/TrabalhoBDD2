CREATE DATABASE bd_trabalho;


USE bd_trabalho;


CREATE TABLE accident_condition (
    Accident_Index BIGINT AUTO_INCREMENT PRIMARY KEY ,
    Accident_Severity SMALLINT NOT NULL,
    Number_of_Vehicles SMALLINT NOT NULL,
    Number_of_Casualties SMALLINT NOT NULL,
    Day_Of_The_Week SMALLINT NOT NULL,
    Light_Conditions SMALLINT NOT NULL,
    Weather_Conditions SMALLINT NOT NULL,
    Road_Surface_Conditions SMALLINT NOT NULL,
    Special_Conditions_at_Site SMALLINT NOT NULL,
    Carriageway_Hazards SMALLINT NOT NULL
);

CREATE TABLE vehicle (
    Idt_Vehicle BIGINT AUTO_INCREMENT PRIMARY KEY,
    Vehicle_Type SMALLINT NOT NULL,
    Vehicle_Manoeuvre SMALLINT NOT NULL,
    Vehicle_Location_Restricted_Lane SMALLINT NOT NULL,
    Skidding_and_Overturning SMALLINT NOT NULL,
    Hit_Object_in_Carriageway SMALLINT NOT NULL,
    Vehicle_Leaving_Carriageway SMALLINT NOT NULL,
    Hit_Object_off_Carriageway SMALLINT NOT NULL,
    first_Point_of_Impact SMALLINT NOT NULL,
    Was_Vehicle_Left_Hand_Drive SMALLINT NOT NULL,
    Journey_Purpose_of_Driver SMALLINT NOT NULL,
    Sex_of_Driver SMALLINT NOT NULL,
    Age_of_Driver SMALLINT NOT NULL,
    Age_Band_of_Driver SMALLINT NOT NULL,
    Engine_Capacity INT NOT NULL,
    Age_of_Vehicle SMALLINT NOT NULL,
    Driver_IMD_Decile SMALLINT NOT NULL,
    Driver_Home_Area_Type SMALLINT NOT NULL
);

CREATE TABLE simples (
    Fk_Simple_Vehicle BIGINT AUTO_INCREMENT PRIMARY KEY,
    Traction SMALLINT NOT NULL,
    Amount_of_Doors SMALLINT NOT NULL,
    FOREIGN KEY (Fk_Simple_Vehicle)
    REFERENCES vehicle (Idt_Vehicle)
);

CREATE TABLE articulated (
    Fk_Articulated_Vehicle BIGINT AUTO_INCREMENT PRIMARY KEY,
    Articulation SMALLINT NOT NULL,
    Guincho BOOLEAN NOT NULL,
    FOREIGN KEY (Fk_Articulated_Vehicle)
    REFERENCES vehicle (Idt_Vehicle)
);

CREATE TABLE location (
    Idt_Location BIGINT AUTO_INCREMENT PRIMARY KEY,
    Latitude VARCHAR(15),
    Longitude VARCHAR(15),
    Road_Class SMALLINT,
    Road_Number SMALLINT,
    Road_Type SMALLINT,
    Speed_Limit SMALLINT,
    Urban_or_Rural_Area SMALLINT,
    Lsoa_of_Accident_Location VARCHAR(9),
    Fk_Accident_Index BIGINT NOT NULL,
    FOREIGN KEY (Fk_Accident_Index)
    REFERENCES accident_condition (Accident_Index)
);

CREATE TABLE authority (
    Idt_Authority BIGINT AUTO_INCREMENT PRIMARY KEY,
    Police_Force SMALLINT NOT NULL,
    District SMALLINT NOT NULL,
    Highway VARCHAR(15) NOT NULL,
    Did_Police_Officer_Attend_Scene_of_Accident SMALLINT NOT NULL,
	Fk_Accident_Index BIGINT NOT NULL,
    FOREIGN KEY (Fk_Accident_Index)
    REFERENCES accident_condition (Accident_Index)
);

CREATE TABLE casualties (
    Idt_Casualties BIGINT AUTO_INCREMENT PRIMARY KEY,
    Casualty_Class SMALLINT NOT NULL,
    Sex_of_Casualty SMALLINT NOT NULL,
    Age_of_Casualty SMALLINT NOT NULL,
    Age_Band_of_Casualty SMALLINT NOT NULL,
    Casualty_Severity SMALLINT NOT NULL,
    Car_Passenger SMALLINT NOT NULL,
    Bus_or_Coach_Passenger SMALLINT NOT NULL,
    Pedestrian_Road_Maintenance_Worker SMALLINT NOT NULL,
    Casualty_Type SMALLINT NOT NULL,
    Casualty_Home_Area_Type SMALLINT NOT NULL  
);

CREATE TABLE second_road (
    Idt_Second_Road BIGINT AUTO_INCREMENT PRIMARY KEY,
    Road_class SMALLINT NOT NULL,
    Road_number SMALLINT NOT NULL,
    Fk_Location BIGINT NOT NULL,
    FOREIGN KEY (Fk_Location)
    REFERENCES location (Idt_Location)
);

CREATE TABLE ped_cross_human (
    Idt_Ped_Cross_Human BIGINT AUTO_INCREMENT PRIMARY KEY,
    Ped_Cross_Human SMALLINT NOT NULL,
    Fk_Authority BIGINT NOT NULL,
    FOREIGN KEY (Fk_Authority)
    REFERENCES authority (Idt_Authority)
);

CREATE TABLE acontece (
    Fk_Accident_Index BIGINT NOT NULL,
    Fk_Vehicle BIGINT NOT NULL,
    PRIMARY KEY (Fk_Accident_Index, Fk_Vehicle),
    FOREIGN KEY (Fk_Accident_Index)
    REFERENCES accident_condition (Accident_Index),
    FOREIGN KEY (Fk_Vehicle)
    REFERENCES vehicle (Idt_Vehicle)
);

CREATE TABLE sofre (
    Fk_Accident_Index BIGINT NOT NULL,
    Fk_Casualties BIGINT NOT NULL,
    PRIMARY KEY (Fk_Accident_Index, Fk_Casualties),
    FOREIGN KEY (Fk_Casualties)
    REFERENCES casualties (Idt_Casualties),
    FOREIGN KEY (Fk_Accident_Index)
    REFERENCES accident_condition (Accident_Index)
);

