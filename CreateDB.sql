CREATE TABLE Acidente_Condicao (
    Accident_Index VARCHAR PRIMARY KEY,
    Accident_Severity SMALLINT,
    Number_of_Casualties SMALLINT,
    Number_of_Vehicles SMALLINT,
    Data DATE,
    dia_da_semana SMALLINT,
    Light_Conditions SMALLINT,
    Weather_Conditions SMALLINT,
    Road_Surface_Conditions SMALLINT,
    Special_Conditions_at_Site SMALLINT,
    Carriageway_Hazards SMALLINT
);

CREATE TABLE Veiculo (
    auto_increment LONGINT PRIMARY KEY,
    Vehicle_Type SMALLINT,
    Vehicle_Manoeuvre SMALLINT,
    Vehicle_Location-Restricted_Lane SMALLINT,
    Skidding_and_Overturning SMALLINT,
    Hit_Object_in_Carriageway SMALLINT,
    Vehicle_Leaving_Carriageway SMALLINT,
    Hit_Object_off_Carriageway SMALLINT,
    1st_Point_of_Impact SMALLINT,
    Was_Vehicle_Left_Hand_Drive? SMALLINT,
    Journey_Purpose_of_Driver] SMALLINT,
    Sex_of_Driver SMALLINT,
    Age_of_Driver SMALLINT,
    Age_Band_of_Driver SMALLINT,
    Engine_Capacity_(CC) INT,
    Age_of_Vehicle SMALLINT,
    Driver_IMD_Decile SMALLINT,
    Driver_Home_Area_Type SMALLINT
);

CREATE TABLE Simples (
    tração VARCHAR,
    qtd_de_portas SMALLINT,
    fk_Veiculo_auto_increment LONGINT PRIMARY KEY
);

CREATE TABLE Articulado (
    Articulacao SMALLINT,
    fk_guincho_guincho_PK BOOLEAN,
    fk_Veiculo_auto_increment LONGINT PRIMARY KEY
);

CREATE TABLE Local (
    Latitude_Longitude LONGINT PRIMARY KEY,
    Road_class SMALLINT,
    Road_number SMALLINT,
    Speed_limit SMALLINT,
    road_type SMALLINT,
    Urban_or_Rural_Area SMALLINT,
    LSOA_of_Accident_Location VARCHAR,
    fk_Acidente_Condicao_Accident_Index VARCHAR
);

CREATE TABLE Autoridade (
    Police_Force SMALLINT,
    District SMALLINT,
    Highway SMALLINT,
    Did_Police_Officer_Attend_Scene_of_Accident SMALLINT,
    auto_increment LONGINT PRIMARY KEY,
    fk_Acidente_Condicao_Accident_Index VARCHAR
);

CREATE TABLE casualidades (
    Casualty_Class SMALLINT,
    Sex_of_Casualty SMALLINT,
    Age_of_Casualty SMALLINT,
    Age_Band_of_Casualty SMALLINT,
    Casualty_Severity SMALLINT,
    Car_Passenger SMALLINT,
    Bus_or_Coach_Passenger SMALLINT,
    Pedestrian_Road_Maintenance_Worker SMALLINT,
    Casualty_Type SMALLINT,
    Casualty_Home_Area_Type SMALLINT,
    auto_increment LONGINT PRIMARY KEY
);

CREATE TABLE guincho (
    guincho SMALLINT,
    fk_art_guin LONGINT
);

CREATE TABLE 2nd road (
    Road_class SMALLINT,
    Road_number SMALLINT,
    fk_Local_2nd LONGINT
);

CREATE TABLE junction (
    detail SMALLINT,
    control SMALLINT,
    location SMALLINT,
    fk_Local_junction LONGINT
);

CREATE TABLE Ped_Location (
    Ped_Location SMALLINT,
    fk_Local_ped_location LONGINT
);

CREATE TABLE Ped_Cross_Physical (
    Ped_Cross_Physical SMALLINT,
    fk_local_ped_cross LONGINT
);

CREATE TABLE Ped_Cross_Human (
    Ped_Cross_Human SMALLINT,
    fk_Autoridade_Ped_Cross_Human LONGINT
);

CREATE TABLE acontece (
    fk_Acidente_Condicao_Accident_Index VARCHAR,
    fk_Veiculo_auto_increment LONGINT
);

CREATE TABLE sofre (
    fk_casualidades_auto_increment LONGINT,
    fk_Acidente_Condicao_Accident_Index VARCHAR
);
 
ALTER TABLE Simples ADD CONSTRAINT FK_Simples_2
    FOREIGN KEY (fk_Veiculo_auto_increment)
    REFERENCES Veiculo (auto_increment)
    ON DELETE CASCADE;
 
ALTER TABLE Articulado ADD CONSTRAINT FK_Articulado_2
    FOREIGN KEY (fk_guincho_guincho_PK???)
    REFERENCES ??? (???)
    ON DELETE CASCADE;
 
ALTER TABLE Articulado ADD CONSTRAINT FK_Articulado_3
    FOREIGN KEY (fk_Veiculo_auto_increment)
    REFERENCES Veiculo (auto_increment)
    ON DELETE CASCADE;
 
ALTER TABLE Local ADD CONSTRAINT FK_Local_1
    FOREIGN KEY (fk_Acidente_Condicao_Accident_Index)
    REFERENCES Acidente_Condicao (Accident_Index)
    ON DELETE RESTRICT;
 
ALTER TABLE Autoridade ADD CONSTRAINT FK_Autoridade_2
    FOREIGN KEY (fk_Ped_Cross_Human_Ped_Cross_Human_PK???)
    REFERENCES ??? (???)
    ON DELETE CASCADE;
 
ALTER TABLE Autoridade ADD CONSTRAINT FK_Autoridade_3
    FOREIGN KEY (fk_Acidente_Condicao_Accident_Index)
    REFERENCES Acidente_Condicao (Accident_Index)
    ON DELETE RESTRICT;
 
ALTER TABLE guincho ADD CONSTRAINT FK_guincho_1
    FOREIGN KEY (fk_art_guin)
    REFERENCES Articulado (fk_Veiculo_auto_increment);
 
ALTER TABLE 2nd road ADD CONSTRAINT FK_2nd road_1
    FOREIGN KEY (fk_Local_2nd)
    REFERENCES Local (Latitude_Longitude);
 
ALTER TABLE junction ADD CONSTRAINT FK_junction_1
    FOREIGN KEY (fk_Local_junction)
    REFERENCES Local (Latitude_Longitude);
 
ALTER TABLE Ped_Location ADD CONSTRAINT FK_Ped_Location_1
    FOREIGN KEY (fk_Local_ped_location)
    REFERENCES Local (Latitude_Longitude);
 
ALTER TABLE Ped_Cross_Physical ADD CONSTRAINT FK_Ped_Cross_Physical_1
    FOREIGN KEY (fk_local_ped_cross)
    REFERENCES Local (Latitude_Longitude);
 
ALTER TABLE Ped_Cross_Human ADD CONSTRAINT FK_Ped_Cross_Human_1
    FOREIGN KEY (fk_Autoridade_Ped_Cross_Human)
    REFERENCES Autoridade (auto_increment);
 
ALTER TABLE acontece ADD CONSTRAINT FK_acontece_1
    FOREIGN KEY (fk_Acidente_Condicao_Accident_Index)
    REFERENCES Acidente_Condicao (Accident_Index)
    ON DELETE RESTRICT;
 
ALTER TABLE acontece ADD CONSTRAINT FK_acontece_2
    FOREIGN KEY (fk_Veiculo_auto_increment)
    REFERENCES Veiculo (auto_increment)
    ON DELETE RESTRICT;
 
ALTER TABLE sofre ADD CONSTRAINT FK_sofre_1
    FOREIGN KEY (fk_casualidades_auto_increment)
    REFERENCES casualidades (auto_increment)
    ON DELETE RESTRICT;
 
ALTER TABLE sofre ADD CONSTRAINT FK_sofre_2
    FOREIGN KEY (fk_Acidente_Condicao_Accident_Index)
    REFERENCES Acidente_Condicao (Accident_Index)
    ON DELETE SET NULL;
