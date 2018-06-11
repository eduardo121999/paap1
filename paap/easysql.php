<?php

/*
	This library was created by Enigma under MIT License
	@github-author Underfisk
	@package easySQL
	@description PHP lightweight library for easy pdo mysql contact
*/

class DatabaseInformation
{   
    private $host   =   'localhost';
    private $user   =   'root';
    private $pwd    =   ''; //if no pw, let it blank
    private $db     =   'perfplace';

    public function __construct($host = NULL,$user = NULL, $pwd = NULL, $db = NULL)
    {
        //init the con values
        if ($host != NULL)
            $this->host = $host;
        if($user != NULL)
            $this->user = $user;
        if ($pwd != NULL)
            $this->pwd = $pwd;
        if ($db != NULL)
            $this->db = $db;
    }

    /*
    MySQL Get Methods
    */
    public function getHost()       {   return $this->host;     }
    public function getUser()       {   return $this->user;     }
    public function getPassword()   {   return $this->pwd;      }
    public function getDatabase()   {   return $this->db;       }
    /*
    MySQL Set Methods
    */
    public function setHost($h)       {   $this->host   = $h;    }
    public function setUser($u)       {   $this->user   = $u;    }
    public function setPassword($p)   {   $this->pwd    = $p;    }
    public function setDatabase($d)   {   $this->db     = $d;    }


    public function getConnection()
    {
        return new PDO("mysql:host=$this->host; database=$this->db; ",$this->user,$this->pwd);
    }


    
}

class easySQL
{

    // TODO : create table query
    //easySQL->create($table_sql);
    //easySQL->drop($table_name);
    

    //easySQL->crud->update($sql,...)...
    //easySQL->query($sql,$args)
    //easySQL->setHost($host)
    //easySQL->setUser($user)
    //easySQL->setPwd($pwd)

    private $dbi = null;

    public function __construct()
    {
        /* To be filled with correct minimal version
        if (!version_compare(PHP_VERSION, '5.1.0') >= 0) 
        {
            die('We do not support your version, just 5.1.0 supported pdo');
        }*/
        if ($this->dbi == null)
            $this->dbi = new DatabaseInformation();
        
        //$this->Connect(); //make sure always we come in the class that we have connection 
    }

    public function Connect()
    {
        try
        {
            $this->dbi->getConnection()->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return true;
        }
        catch(PDOException $e)
        {
            die('PDO Error:' . $e->getMessage());
        }
    }

	public function query($sql,$args = null)
	{
        try
        {
            $conn = $this->dbi->getConnection(); //con pdo object
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); //add the debugger extra options
            $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false); //set emulation off
            
            if ($args != null)
            {
                $stmt = $conn->prepare($sql);
                foreach($args as $param => $value)
                {
                    $stmt->bindParam($param,$value);
                }

                $stmt->execute();
            }
            else
            {
                $stmt= $conn->prepare($sql);
                $stmt->execute();
            }

            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $conn = null; //pdo destroy
            return $result; //return result
        }
        catch(PDOException $e)
        {
            die('PDO Debug:' . $e->getMessage());
        }

	}
}
?>
