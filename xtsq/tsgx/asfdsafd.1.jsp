<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�����ļ�</title>
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

Hashtable<String,String> coluTypeHash;//����е���������

try {
	conn=cf.getConnection();

	coluTypeHash=new Hashtable<String,String>();

	conn.setAutoCommit(false);

	//���ɲ���SQL���++++++++++++++++++++++++++++++++++++++++
	String insertSql=null;//ȡ�����ݵ�SQL���
	String valuesSql=" VALUES ( ";//ȡ�����ݵ�SQL���
	String setInsertParam="";//����Insert�����Ĵ���
	insertSql="	INSERT INTO "+table_name.toUpperCase()+" ( ";

	int colnum=0;
	//��ȡ��ṹ
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
		
	
		if (data_type.equals("NUMBER"))//�ֶ�����Ϊ����
		{
			if (data_scale==0){//��С��λ
				data_type="INT";
				data_length=data_precision;//�ֶγ���
				if (data_length>18)
				{
					data_length=18;//�ֶγ���
				}
			}
			else{//��С��λ
				data_type="DOUBLE";
				data_length=data_precision+1;//�ֶγ���
			}
		}
		else if (data_type.equals("DATE"))//�ֶ�����Ϊ����
		{
			data_length=10;//�ֶγ���
		}

		//CHAR��VARCHAR2��DOUBLE��INT��DATE��


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

	//���ɲ���SQL���--------------------------------------------------

	//��ȡTXT�ļ����������ݿ⣫��������������������������������������������

	fis= new java.io.LineNumberReader(new java.io.FileReader(filename));

	String lineStr="";
	while ( (lineStr=fis.readLine())!=null )//��һ������
	{
		//��ʼһ���¼�¼

		ps= conn.prepareStatement(insertSql);

//		out.println("<BR>"+lineStr);
		int qd=0;
		int zd=-1;
		String fstr="";

		colnum=0;
		//�ֱ�ȡ���ֶε�ֵ
		byte[] buffer=lineStr.getBytes();
		for (int i=0;i<buffer.length ;i++ )
		{
			if (buffer[i]==9)//����һ�����ֶ�
			{
				qd=zd+1;
				zd=i;
				fstr=new String(buffer,qd,zd-qd);
//				out.println("["+fstr+"]");

				colnum++;

				//�����ֶ�ֵ
				data_type=(String)coluTypeHash.get(String.valueOf(colnum));//���������
				if (data_type.equals("INT"))//�ֶ�����Ϊ����
				{
					ps.setInt(colnum,Integer.parseInt(fstr) );
				}
				else if (data_type.equals("DOUBLE"))//�ֶ�����Ϊʵ��
				{
					ps.setDouble(colnum,Double.parseDouble(fstr) );
				}
				else if (data_type.equals("DATE"))//�ֶ�����Ϊ����
				{
					ps.setDate(colnum,java.sql.Date.valueOf(fstr));
				}
				else if (data_type.equals("VARCHAR2"))//�ֶ�����Ϊ����
				{
					ps.setString(colnum,fstr);
				}
				else if (data_type.equals("CHAR"))//�ֶ�����Ϊ����
				{
					ps.setString(colnum,fstr);
				}
			}
		}

		//���һ���ֶ�
		qd=zd+1;
		zd=buffer.length;
		fstr=new String(buffer,qd,zd-qd);
//		out.println("["+fstr+"]");

		colnum++;

		//�������һ���ֶ�ֵ
		data_type=(String)coluTypeHash.get(String.valueOf(colnum));//���������
		if (data_type.equals("INT"))//�ֶ�����Ϊ����
		{
			ps.setInt(colnum,Integer.parseInt(fstr) );
		}
		else if (data_type.equals("DOUBLE"))//�ֶ�����Ϊʵ��
		{
			ps.setDouble(colnum,Double.parseDouble(fstr) );
		}
		else if (data_type.equals("DATE"))//�ֶ�����Ϊ����
		{
			ps.setDate(colnum,java.sql.Date.valueOf(fstr));
		}
		else if (data_type.equals("VARCHAR2"))//�ֶ�����Ϊ����
		{
			ps.setString(colnum,fstr);
		}
		else if (data_type.equals("CHAR"))//�ֶ�����Ϊ����
		{
			ps.setString(colnum,fstr);
		}

		//ִ��SQL��ɲ������
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
