CREATE TABLE Acidente_Condicao (
    Accident_Index VARCHAR PRIMARY KEY NOT NULL,
    Accident_Severity SMALLINT NOT NULL,
    Number_of_Casualties SMALLINT NOT NULL,
    Number_of_Vehicles SMALLINT NOT NULL,
    Data DATE NOT NULL,
    dia_da_semana SMALLINT NOT NULL,
    Light_Conditions SMALLINT NOT NULL,
    Weather_Conditions SMALLINT NOT NULL,
    Road_Surface_Conditions SMALLINT NOT NULL,
    Special_Conditions_at_Site SMALLINT NOT NULL,
    Carriageway_Hazards SMALLINT NOT NULL
);

CREATE TABLE Veiculo (
    auto_increment LONGINT PRIMARY KEY NOT NULL,
    Vehicle_Type SMALLINT NOT NULL,
    Vehicle_Manoeuvre SMALLINT NOT NULL,
    Vehicle_Location-Restricted_Lane SMALLINT NOT NULL,
    Skidding_and_Overturning SMALLINT NOT NULL,
    Hit_Object_in_Carriageway SMALLINT NOT NULL,
    Vehicle_Leaving_Carriageway SMALLINT NOT NULL,
    Hit_Object_off_Carriageway SMALLINT NOT NULL,
    1st_Point_of_Impact SMALLINT NOT NULL,
    Was_Vehicle_Left_Hand_Drive? SMALLINT NOT NULL,
    Journey_Purpose_of_Driver] SMALLINT NOT NULL,
    Sex_of_Driver SMALLINT NOT NULL,
    Age_of_Driver SMALLINT NOT NULL,
    Age_Band_of_Driver SMALLINT NOT NULL,
    Engine_Capacity_(CC) INT NOT NULL,
    Age_of_Vehicle SMALLINT NOT NULL,
    Driver_IMD_Decile SMALLINT NOT NULL,
    Driver_Home_Area_Type SMALLINT NOT NULL
);

CREATE TABLE Simples (
    tração VARCHAR NOT NULL,
    qtd_de_portas SMALLINT NOT NULL,
    fk_Veiculo_auto_increment LONGINT PRIMARY KEY NOT NULL
);

CREATE TABLE Articulado (
    Articulacao SMALLINT NOT NULL,
    fk_guincho_guincho_PK BOOLEAN NOT NULL,
    fk_Veiculo_auto_increment LONGINT PRIMARY KEY NOT NULL
);

CREATE TABLE Local (
    Latitude_Longitude LONGINT PRIMARY KEY NOT NULL,
    Road_class SMALLINT NOT NULL,
    Road_number SMALLINT NOT NULL,
    Speed_limit SMALLINT NOT NULL,
    road_type SMALLINT NOT NULL,
    Urban_or_Rural_Area SMALLINT NOT NULL,
    LSOA_of_Accident_Location VARCHAR NOT NULL,
    fk_Acidente_Condicao_Accident_Index VARCHAR NOT NULL
);

CREATE TABLE Autoridade (
    Police_Force SMALLINT NOT NULL,
    District SMALLINT NOT NULL,
    Highway SMALLINT NOT NULL,
    Did_Police_Officer_Attend_Scene_of_Accident SMALLINT NOT NULL,
    auto_increment LONGINT PRIMARY KEY NOT NULL,
    fk_Acidente_Condicao_Accident_Index VARCHAR NOT NULL
);

CREATE TABLE casualidades (
    Casualty_Class SMALLINT NOT NULL,
    Sex_of_Casualty SMALLINT NOT NULL,
    Age_of_Casualty SMALLINT NOT NULL,
    Age_Band_of_Casualty SMALLINT NOT NULL,
    Casualty_Severity SMALLINT NOT NULL,
    Car_Passenger SMALLINT NOT NULL,
    Bus_or_Coach_Passenger SMALLINT NOT NULL,
    Pedestrian_Road_Maintenance_Worker SMALLINT NOT NULL,
    Casualty_Type SMALLINT NOT NULL,
    Casualty_Home_Area_Type SMALLINT NOT NULL,
    auto_increment LONGINT PRIMARY KEY NOT NULL
);

CREATE TABLE guincho (
    guincho SMALLINT NOT NULL,
    fk_art_guin LONGINT NOT NULL
);

CREATE TABLE 2nd road (
    Road_class SMALLINT NOT NULL,
    Road_number SMALLINT NOT NULL,
    fk_Local_2nd LONGINT NOT NULL
);

CREATE TABLE junction (
    detail SMALLINT NOT NULL,
    control SMALLINT NOT NULL,
    location SMALLINT NOT NULL,
    fk_Local_junction LONGINT NOT NULL
);

CREATE TABLE Ped_Location (
    Ped_Location SMALLINT NOT NULL,
    fk_Local_ped_location LONGINT NOT NULL NOT NULL
);

CREATE TABLE Ped_Cross_Physical (
    Ped_Cross_Physical SMALLINT NOT NULL,
    fk_local_ped_cross LONGINT NOT NULL
);

CREATE TABLE Ped_Cross_Human (
    Ped_Cross_Human SMALLINT NOT NULL,
    fk_Autoridade_Ped_Cross_Human LONGINT NOT NULL
);

CREATE TABLE acontece (
    fk_Acidente_Condicao_Accident_Index VARCHAR NOT NULL,
    fk_Veiculo_auto_increment LONGINT NOT NULL
);

CREATE TABLE sofre (
    fk_casualidades_auto_increment LONGINT NOT NULL,
    fk_Acidente_Condicao_Accident_Index VARCHAR NOT NULL
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
