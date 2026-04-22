
Use DATACO_DW;
/*dim customer*/

-- Dimension: Date (Essential for any Star Schema)
CREATE TABLE Dim_Date (
    Date_Key INT PRIMARY KEY, -- Format: YYYYMMDD
    Full_Date DATETIME,
    Day_Of_Week INT,
    Day_Name NVARCHAR(20),
    Month_Int INT,
    Month_Name NVARCHAR(20),
    Quarter INT,
    Year_Int INT
);

-- Dimension: Product (Flattened Hierarchy)
CREATE TABLE Dim_Product (
    Product_Key INT IDENTITY(1,1) PRIMARY KEY, -- Surrogate Key
    Product_ID INT,                             -- Natural Key 
    Product_Name NVARCHAR(255),
    Category_Name NVARCHAR(100),
    Product_Price FLOAT
);


-- Dimension: Customer (SCD Type 2 Implementation)
CREATE TABLE Dim_Customer (
    Customer_Key INT IDENTITY(1,1) PRIMARY KEY, -- Surrogate Key
    Customer_ID INT,                            -- Natural Key
    First_Name NVARCHAR(50),
    Last_Name NVARCHAR(50),
    Segment NVARCHAR(50),
    City NVARCHAR(50),
    State NVARCHAR(50),
    Country NVARCHAR(50),
    -- SCD Type 2 Mandatory Columns
    Start_Date DATETIME,                        -- When record became active
    End_Date DATETIME,                          -- When record expired (NULL if active)
    Is_Current BIT DEFAULT 1                    -- 1 = Current Active Record
);

/*Create fact sales table*/

CREATE TABLE Fact_Sales (
    Sales_Key INT IDENTITY(1,1) PRIMARY KEY, 
    Order_ID INT,                            
    Order_Item_ID INT,                       
    
   
    Product_Key INT FOREIGN KEY REFERENCES Dim_Product(Product_Key),
    Customer_Key INT FOREIGN KEY REFERENCES Dim_Customer(Customer_Key),
    Order_Date_Key INT FOREIGN KEY REFERENCES Dim_Date(Date_Key),
    
    
    Quantity INT,
    Sales_Amount FLOAT,
    Discount_Amount FLOAT,
    Order_Profit FLOAT,
    
    
    accm_txn_create_time DATETIME,           
    accm_txn_complete_time DATETIME,         
    txn_process_time_hours INT               
);


CREATE TABLE [Customer_Insert](
	[Customer_Key] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NULL,
	[First_Name] [nvarchar](50) NULL,
	[Last_Name] [nvarchar](50) NULL,
	[Segment] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Start_Date] [datetime] NULL,

)

CREATE TABLE [Customer_Update](
	[Customer_Key] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NULL,
	[First_Name] [nvarchar](50) NULL,
	[Last_Name] [nvarchar](50) NULL,
	[Segment] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,

)


