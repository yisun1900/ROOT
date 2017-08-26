<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>上载文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<%
java.io.LineNumberReader fis= null;

String table_name=cf.GB2Uni(request.getParameter("tab1"));
String filename=cf.GB2Uni(request.getParameter("mu1"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String column_name=null;
String column_china=null;
String data_type=null;
String nullable=null;
int data_length=0;
int data_precision=0;
int data_scale=0;
String data_default=null;
String constraint_type=null;
String iskey=null;

Hashtable<String,String> coluTypeHash;//存放列的类型名称

try {
	conn=cf.getConnection();

	coluTypeHash=new Hashtable<String,String>();

	conn.setAutoCommit(false);

	//生成插入SQL语句++++++++++++++++++++++++++++++++++++++++
	String insertSql=null;//取得数据的SQL语句
	String valuesSql=" VALUES ( ";//取得数据的SQL语句
	String setInsertParam="";//设置Insert参数的代码
	insertSql="	INSERT INTO "+table_name.toUpperCase()+" ( ";

	int colnum=0;
	//获取表结构
	ls_sql="select user_tab_columns.column_name,comments,data_type,data_length,data_precision,data_scale,nullable,data_default ";
	ls_sql+=" from user_tab_columns,user_col_comments ";
	ls_sql+=" where user_tab_columns.table_name=user_col_comments.table_name";
	ls_sql+=" and user_tab_columns.column_name=user_col_comments.column_name";
	ls_sql+=" and user_tab_columns.table_name='"+table_name.toUpperCase()+"'";
	ls_sql+=" order by column_id";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		column_name=rs.getString("column_name");
		column_china=rs.getString("comments");
		data_length=rs.getInt("data_length");
		data_precision=rs.getInt("data_precision");
		data_scale=rs.getInt("data_scale");
		data_type=rs.getString("data_type");
		nullable=rs.getString("nullable");
		data_default=cf.fillNull(rs.getString("data_default"));
		
	
		if (data_type.equals("NUMBER"))//字段类型为数字
		{
			if (data_scale==0){//无小数位
				data_type="INT";
				data_length=data_precision;//字段长度
				if (data_length>18)
				{
					data_length=18;//字段长度
				}
			}
			else{//有小数位
				data_type="DOUBLE";
				data_length=data_precision+1;//字段长度
			}
		}
		else if (data_type.equals("DATE"))//字段类型为日期
		{
			data_length=10;//字段长度
		}

		//CHAR、VARCHAR2、DOUBLE、INT、DATE、


		colnum++;

		valuesSql+="?,";
		insertSql+=column_name.toLowerCase()+",";

		coluTypeHash.put(String.valueOf(colnum),data_type);

	}
	rs.close();
	ps.close();

	valuesSql=valuesSql.substring(0,valuesSql.length()-1)+" ) ";

	insertSql=insertSql.substring(0,insertSql.length()-1)+" ) ";
	insertSql+=valuesSql;

	//生成插入SQL语句--------------------------------------------------

	//读取TXT文件，插入数据库＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋

	fis= new java.io.LineNumberReader(new java.io.FileReader(filename));

	String lineStr="";
	while ( (lineStr=fis.readLine())!=null )//读一行数据
	{
		//开始一条新记录

		ps= conn.prepareStatement(insertSql);

//		out.println("<BR>"+lineStr);
		int qd=0;
		int zd=-1;
		String fstr="";

		colnum=0;
		//分别取各字段的值
		byte[] buffer=lineStr.getBytes();
		for (int i=0;i<buffer.length ;i++ )
		{
			if (buffer[i]==9)//生成一个新字段
			{
				qd=zd+1;
				zd=i;
				fstr=new String(buffer,qd,zd-qd);
//				out.println("["+fstr+"]");

				colnum++;

				//设置字段值
				data_type=(String)coluTypeHash.get(String.valueOf(colnum));//获得列类型
				if (data_type.equals("INT"))//字段类型为整型
				{
					ps.setInt(colnum,Integer.parseInt(fstr) );
				}
				else if (data_type.equals("DOUBLE"))//字段类型为实数
				{
					ps.setDouble(colnum,Double.parseDouble(fstr) );
				}
				else if (data_type.equals("DATE"))//字段类型为日期
				{
					ps.setDate(colnum,java.sql.Date.valueOf(fstr));
				}
				else if (data_type.equals("VARCHAR2"))//字段类型为日期
				{
					ps.setString(colnum,fstr);
				}
				else if (data_type.equals("CHAR"))//字段类型为日期
				{
					ps.setString(colnum,fstr);
				}
			}
		}

		//最后一个字段
		qd=zd+1;
		zd=buffer.length;
		fstr=new String(buffer,qd,zd-qd);
//		out.println("["+fstr+"]");

		colnum++;

		//设置最后一个字段值
		data_type=(String)coluTypeHash.get(String.valueOf(colnum));//获得列类型
		if (data_type.equals("INT"))//字段类型为整型
		{
			ps.setInt(colnum,Integer.parseInt(fstr) );
		}
		else if (data_type.equals("DOUBLE"))//字段类型为实数
		{
			ps.setDouble(colnum,Double.parseDouble(fstr) );
		}
		else if (data_type.equals("DATE"))//字段类型为日期
		{
			ps.setDate(colnum,java.sql.Date.valueOf(fstr));
		}
		else if (data_type.equals("VARCHAR2"))//字段类型为日期
		{
			ps.setString(colnum,fstr);
		}
		else if (data_type.equals("CHAR"))//字段类型为日期
		{
			ps.setString(colnum,fstr);
		}

		//执行SQL完成插入操作
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	fis.close();

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);

	fis.close();
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
</body>
</html>
