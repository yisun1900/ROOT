<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������� </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String bjjbbm = null;
String bjjbmc = null;
String dqbm = null;
String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;

String tccpdlbm=null;
String cldlmc=null;
String tccplbbm=null;
String clxlmc=null;
String tcsjflbm=null;
String tcsjflmc=null;
String sfbxx=null;
String sfbxxStr=null;
String sfyxsj=null;
String sfyxsjStr=null;
String sfyqxtpp=null;
String sfyqxtppStr=null;
String jldw=null;
String bzslStr=null;
String sfxzsl=null;
String sfxzslStr=null;

String sfkjmStr=null;
String sfkjm=null;
String yxjmzdslStr=null;
String jmdjStr=null;
String sfkghStr=null;
String sfkgh=null;
String khzdslStr=null;
String ghzjStr=null;

double yxjmzdsl=0;
double jmdj=0;
double khzdsl=0;
double ghzj=0;


double bzsl=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

int row=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dqbm =up.getParameter("dqbm");
	bjjbbm =up.getParameter("bjjbbm");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select dqmc " ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString("dqmc");			    
	}
	rs.close();
	ps.close();

	sql=" select bjjbmc" ;
	sql+=" from bdm_bjjbbm " ;
	sql+=" where bjjbbm='"+bjjbbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		bjjbmc = rs.getString("bjjbmc");			    
	}
	rs.close();
	ps.close();
	%> 
<form method="post" action="SaveLoadDataZc.jsp" name="editform" target="_blank">
<div align="center">
    <p>�ײͱ�׼������Ŀ</p>
    <p><font color="#FF0000"><b>��ע�⣺</b></font><b>���ۼ���</b><font color="#FF0000"><b>[<%=bjjbmc%>]</b></font><b>��</b><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">


  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="9%">��Ʒ����</td>
	<td  width="9%">��ƷС��</td>
	<td  width="9%">�ײ���������</td>
	<td  width="5%">�Ƿ��ѡ��</td>
	<td  width="5%">�����Ƿ��շ�</td>
	<td  width="5%">�Ƿ�Ҫ����ͬƷ��</td>
	<td  width="5%">������λ</td>
	<td  width="5%">��׼����</td>
	<td  width="7%">�Ƿ���������</td>
	<td  width="6%">�Ƿ�ɼ���</td>
	<td  width="6%">���������������</td>
	<td  width="6%">���ⵥ��</td>
	<td  width="6%">�Ƿ�ɸ���</td>
	<td  width="6%">�ɻ��������</td>
	<td  width="6%">�����ۼ�</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][1].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}
		row++;

		int len=outStr[i].length;
		if (len<8)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		cldlmc=outStr[i][0].trim();
		clxlmc=outStr[i][1].trim();
		tcsjflmc=outStr[i][2].trim();
		sfbxxStr=outStr[i][3].trim();
		sfyxsjStr=outStr[i][4].trim();
		sfyqxtppStr=outStr[i][5].trim();
		jldw=outStr[i][6].trim();
		sfxzslStr=outStr[i][7].trim();
		bzslStr=outStr[i][8].trim();

		sfkjmStr=outStr[i][9].trim();
		yxjmzdslStr=outStr[i][10].trim();
		jmdjStr=outStr[i][11].trim();
		sfkghStr=outStr[i][12].trim();
		khzdslStr=outStr[i][13].trim();
		ghzjStr=outStr[i][14].trim();


		sql=" select cldlbm" ;
		sql+=" from jxc_cldlbm " ;
		sql+=" where cldlmc='"+cldlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			tccpdlbm = rs.getString("cldlbm");			    
		}
		else{
			out.println("�к�["+row+"]���󣡲����ڵ�[��Ʒ����]��"+cldlmc);
			return;
		}
		rs.close();
		ps.close();



		sql=" select clxlbm" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where clxlmc='"+clxlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			tccplbbm = rs.getString("clxlbm");			    
		}
		else{
			out.println("�к�["+row+"]���󣡲����ڵ�[��ƷС��]��"+clxlmc);
			return;
		}
		rs.close();
		ps.close();

		if (!tcsjflmc.equals(""))
		{
			sql=" select tcsjflbm" ;
			sql+=" from bdm_tcsjflbm " ;
			sql+=" where tcsjflmc='"+tcsjflmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				tcsjflbm = rs.getString("tcsjflbm");			    
			}
			else{
				out.println("�к�["+row+"]���󣡲����ڵ�[�ײ���������]��"+tcsjflmc);
				return;
			}
			rs.close();
			ps.close();
		}
		else{
			tcsjflbm="";
			tcsjflmc="";
		}

		if (sfbxxStr.equals("��"))
		{
			sfbxx="Y";
		}
		else if (sfbxxStr.equals("��"))
		{
			sfbxx="N";
		}
		else{
			out.println("�к�["+row+"]����[�Ƿ��ѡ��]ֻ��Ϊ���ǡ��񡿣�ĿǰΪ["+sfbxxStr+"]");
			return;
		}


		if (sfyxsjStr.equals("��"))
		{
			sfyxsj="Y";
		}
		else if (sfyxsjStr.equals("��"))
		{
			sfyxsj="N";
		}
		else{
			out.println("�к�["+row+"]����[�����Ƿ��շ�]ֻ��Ϊ���ǡ��񡿣�ĿǰΪ["+sfyxsjStr+"]");
			return;
		}



		if (sfyqxtppStr.equals("��"))
		{
			sfyqxtpp="Y";
		}
		else if (sfyqxtppStr.equals("��"))
		{
			sfyqxtpp="N";
		}
		else{
			out.println("�к�["+row+"]����[�Ƿ�Ҫ����ͬƷ��]ֻ��Ϊ���ǡ��񡿣�ĿǰΪ["+sfyqxtppStr+"]");
			return;
		}


		sql=" select jldwmc" ;
		sql+=" from jdm_jldwbm " ;
		sql+=" where jldwmc='"+jldw+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			jldw = rs.getString("jldwmc");			    
		}
		else{
			out.println("�к�["+row+"]���󣡲����ڵ�[������λ]��"+jldw);
			return;
		}
		rs.close();
		ps.close();




		if (sfxzslStr.equals("������Ӽ�"))
		{
			sfxzsl="1";
		}
		else if (sfxzslStr.equals("���ɳ���"))
		{
			sfxzsl="2";
		}
		else if (sfxzslStr.equals("����������"))
		{
			sfxzsl="3";
		}
		else{
			out.println("�к�["+row+"]����[�Ƿ���������]ֻ��Ϊ��������Ӽۣ����ɳ��������������ơ���ĿǰΪ["+sfxzslStr+"]");
			return;
		}




		bzsl=0;
		if (sfxzsl.equals("1"))
		{
			if (bzslStr.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[��׼����]����Ϊ��");
				return;
			}
			else{
				try{
					bzsl=Double.parseDouble(bzslStr.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[��׼����:"+bzslStr+"]��������:"+e);
					return;
				}
			}

			if (bzsl==0 )
			{
				out.println("�к�["+row+"]����[�Ƿ���������]Ϊ��������Ӽۡ�����׼��������Ϊ0");
				return;
			}
		}
		else if (sfxzsl.equals("2"))
		{
			if (bzslStr.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[��׼����]����Ϊ��");
				return;
			}
			else{
				try{
					bzsl=Double.parseDouble(bzslStr.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[��׼����:"+bzslStr+"]��������:"+e);
					return;
				}
			}

			if (bzsl==0)
			{
				out.println("�к�["+row+"]����[�Ƿ���������]Ϊ�������������׼��������Ϊ0");
				return;
			}

		}
		else{
			if (!bzslStr.equals("") && !bzslStr.equals("0"))
			{
				out.println("<BR>�к�["+row+"]���ѣ�[�Ƿ���������]Ϊ�������ơ�������׼������ӦΪ�գ�����Ϊ��"+bzslStr);
			}
		}

		if (sfkjmStr.equals("�ɼ���"))//1�����ɼ��⣻2���ɼ���
		{
			sfkjm="2";

			if (yxjmzdslStr.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[���������������]����Ϊ��");
				return;
			}
			else{
				try{
					yxjmzdsl=Double.parseDouble(yxjmzdslStr.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[���������������:"+yxjmzdslStr+"]��������:"+e);
					return;
				}
			}

			if (jmdjStr.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[���ⵥ��]����Ϊ��");
				return;
			}
			else{
				try{
					jmdj=Double.parseDouble(jmdjStr.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[���ⵥ��:"+jmdjStr+"]��������:"+e);
					return;
				}
			}
		}
		else
		{
			sfkjm="1";
			sfkjmStr="���ɼ���";
			yxjmzdsl=0;
			jmdj=0;
		}


		if (sfkghStr.equals("�ɻ�"))//1�����ɻ���2���ɻ�
		{
			sfkgh="2";

			if (khzdslStr.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[�ɻ��������]����Ϊ��");
				return;
			}
			else{
				try{
					khzdsl=Double.parseDouble(khzdslStr.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[�ɻ��������:"+khzdslStr+"]��������:"+e);
					return;
				}
			}

			if (ghzjStr.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[�����ۼ�]����Ϊ��");
				return;
			}
			else{
				try{
					ghzj=Double.parseDouble(ghzjStr.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[�����ۼ�:"+ghzjStr+"]��������:"+e);
					return;
				}
			}
		}
		else
		{
			sfkgh="1";
			sfkghStr="���ɻ�";
			khzdsl=0;
			ghzj=0;
		}

		
		if (bzsl==0)
		{
			bzslStr="";
		}
		if (jmdj==0)
		{
			jmdjStr="";
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=cldlmc%>
        <input name="tccpdlbm" type="hidden" value="<%=tccpdlbm%>">
      </td>
      <td><%=clxlmc%>
        <input name="tccplbbm" type="hidden" value="<%=tccplbbm%>">
      </td>
      </td>
      <td><%=tcsjflmc%>
        <input name="tcsjflbm" type="hidden" value="<%=tcsjflbm%>" >
      </td>
      <td><%=sfbxxStr%>
        <input name="sfbxx" type="hidden" value="<%=sfbxx%>" >
      </td>
      <td><%=sfyxsjStr%>
        <input name="sfyxsj" type="hidden" value="<%=sfyxsj%>" >
      </td>
      <td><%=sfyqxtppStr%>
        <input name="sfyqxtpp" type="hidden" value="<%=sfyqxtpp%>" >
      </td>
      <td><%=jldw%>
        <input name="jldw" type="hidden" value="<%=jldw%>" >
      </td>
      <td><%=bzslStr%>
        <input name="bzsl" type="hidden" value="<%=bzsl%>" >
      </td>
      <td><%=sfxzslStr%>
        <input name="sfxzsl" type="hidden" value="<%=sfxzsl%>" >
      </td>
      <td><%=sfkjmStr%>
        <input name="sfkjm" type="hidden" value="<%=sfkjm%>" >
      </td>
      <td><%=yxjmzdslStr%>
        <input name="yxjmzdsl" type="hidden" value="<%=yxjmzdsl%>" >
      </td>
      <td><%=jmdjStr%>
        <input name="jmdj" type="hidden" value="<%=jmdj%>" >
      </td>
      <td><%=sfkghStr%>
        <input name="sfkgh" type="hidden" value="<%=sfkgh%>" >
      </td>
      <td><%=khzdslStr%>
        <input name="khzdsl" type="hidden" value="<%=khzdsl%>" >
      </td>
      <td><%=ghzjStr%>
        <input name="ghzj" type="hidden" value="<%=ghzj%>" >
      </td>
    </tr>
    <%
	}


}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
	out.print("<BR>SQL=" + sql);
	return;
}
finally 
{
	try{
		f.close();
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button" name="bc" value="����" onClick="f_do(editform)">
        <input type="reset"  value="����" onClick="bc.disabled=false">
      ��������Ŀ����<%=row%>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>