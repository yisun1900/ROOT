<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������� </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

%>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;
String[][] outStr=null; 
String ls=null;

String khxm=null;
String xb=null;
String xbstr=null;
String lxfs=null;
String qtdh=null;
String cqbm=null;
String cqbmstr=null;
String xqbm=null;
String louhao=null;
String fwdz=null;
int fwmj=0;
String fwmjstr=null;

String xxlybm=null;
String xxlybmstr=null;
String xxlysm=null;
String sfxhf=null;
String sfxhfstr=null;
java.sql.Date xchfsj=null;
String xchfsjstr=null;
String jzbz=null;
String jzbzstr=null;
String khjl=null;
String sjs=null;
String ywy=null;
String dwmc=null;
String zxdm=null;
String fgsmc=null;
String fgsbh=null;

java.sql.Date yjzxsj=null;
String yjzxsjstr=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrsjstr=null;
String lrbm=null;
String lrbmstr=null;


java.sql.Date ctsj=null;
String ctsjstr=null;
java.sql.Date jhctsj=null;
String jhctsjstr=null;

java.sql.Date cxgtsj=null;
String cxgtsjstr=null;
java.sql.Date jhcxgtsj=null;
String jhcxgtsjstr=null;

java.sql.Date csgtsj=null;
String csgtsjstr=null;
java.sql.Date jhcsgtsj=null;
String jhcsgtsjstr=null;

java.sql.Date sczbjsj=null;
String sczbjsjstr=null;
java.sql.Date jhzbjsj=null;
String jhzbjsjstr=null;

String khzyxz=null;



String bz=null;




Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	
	%> 
<form method="post" action="SaveDisData.jsp" name="editform" target="_blank">
<div align="center">����ͻ���Ϣ</div>
  <table width="300%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="0" cellspacing="1">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="1%">���</td>
      <td width="2%">�ͻ�����</td>
      <td width="1%">�Ա�</td>
	  <td width="6%">��ϵ��ʽ</td>
	  <td width="6%">�����绰</td>
	  <td width="2%">��������</td>
	  <td width="3%">С��</td>
	  <td width="3%">¥��</td>
	  <td width="7%">���ݵ�ַ</td>
      <td width="2%">���ڽ������</td>
	  <td width="2%">�Ƿ���ط�</td>
	  <td width="2%">�ط�����</td>	 
      <td width="2%">ҵ��Ա</td>
	  <td width="3%">�����ֹ�˾</td>
	  <td width="2%">Ԥ��װ��ʱ��</td>
	  <td width="2%">�ͻ���Դ����</td>
	  <td width="2%">¼����</td>
	  <td width="2%">¼��ʱ��</td>
	  <td width="3%">¼�벿��</td>
	  <td width="9%">��ע</td>
	

    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 
	String bgcolor="";
	String row="";

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		
		row=outStr[i][0].trim();
		khxm=outStr[i][1].trim();
		xbstr=outStr[i][2].trim();
		lxfs=outStr[i][3].trim();
		qtdh=outStr[i][4].trim();
		cqbmstr=outStr[i][5].trim();
		xqbm=outStr[i][6].trim();
		louhao=outStr[i][7].trim();
		fwdz=outStr[i][8].trim();
		fwmjstr=outStr[i][9].trim();
		sfxhfstr=outStr[i][10].trim();
		xchfsjstr=outStr[i][11].trim();
		ywy=outStr[i][12].trim();
		fgsmc=outStr[i][13].trim();
		yjzxsjstr=outStr[i][14].trim();
		khzyxz=outStr[i][15].trim();
		lrr=outStr[i][16].trim();

		lrsjstr=outStr[i][17].trim();
		lrbmstr=outStr[i][18].trim();
		bz=outStr[i][19].trim();

		if(khxm==null||khxm.equals(""))
		{
//			out.print("<BR>���ѣ���š�"+row+"���ͻ�����Ϊ�գ����������Զ�������");
			break;
		}

		//��顺�����ֹ�˾���Ƿ���ȷ
		String dqbm=null;
		sql="select dwbh,dqbm";
		sql+=" from  sq_dwxx";
		sql+=" where dwmc='"+fgsmc.trim()+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgsbh=rs.getString("dwbh");
			dqbm=rs.getString("dqbm");
		}
		else{
			out.print("<BR>��š�"+row+"�����������ֹ�˾��"+fgsmc+"�������ڣ�");
			return;
		}
		rs.close();
		ps.close();


		//��顺¼�벿�š��Ƿ���ȷ
		sql="select dwbh";
		sql+=" from  sq_dwxx";
		sql+=" where dwmc='"+lrbmstr.trim()+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			lrbm=rs.getString("dwbh");
		}
		else{
			out.print("<BR>��š�"+row+"������¼�벿�š�"+lrbmstr+"�������ڣ�");
			return;
		}
		rs.close();
		ps.close();

		//��顺�Ա��Ƿ���ȷ
		if (xbstr==null || xbstr.equals(""))//M;�У�W��Ů
		{
			out.print("<BR>��š�"+row+"�����󣡡��Ա𡻲���Ϊ�գ�");
			return;
		}
		else if (xbstr.trim().equals("��"))
		{
			xb="M";
		}
		else if (xbstr.trim().equals("Ů"))
		{
			xb="W";
		}
		else{
			out.print("<BR>��š�"+row+"�����󣡡��Ա𡻲���ȷ��ֻ���ǡ��С�Ů������֮һ��");
			return;
		}

		//��顺�����������Ƿ���ȷ
		if (cqbmstr==null || cqbmstr.equals(""))
		{
			cqbm="";
		}
		else{
			sql="select cqbm";
			sql+=" from  dm_cqbm";
			sql+=" where dqbm='"+dqbm+"' and cqmc='"+cqbmstr.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cqbm=rs.getString("cqbm");
			}
			else{
				out.print("<BR>��š�"+row+"����������������"+cqbmstr+"�������ڣ�");
				return;
			}
			rs.close();
			ps.close();
		}

		//��顺���ݵ�ַ���Ƿ���ȷ
		if (fwdz==null || fwdz.equals(""))
		{
			out.print("<BR>��š�"+row+"�����󣡡����ݵ�ַ������Ϊ�գ�");
			return;
		}


		//��顺���ڽ���������Ƿ���ȷ
		if (fwmjstr==null || fwmjstr.equals(""))
		{
			fwmj=0;
		}
		else{
			try{
				fwmj=(int)Double.parseDouble(fwmjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"���������ڽ��������"+fwmjstr+"�������������ͣ�");
				return;
			}
		}


		//��顺�Ƿ���طá��Ƿ���ȷ
		if (sfxhfstr==null || sfxhfstr.equals(""))//Y����طã�N������ط�
		{
			out.print("<BR>��š�"+row+"�����󣡡��Ƿ���طá�����Ϊ�գ�");
			return;
		}
		else if (sfxhfstr.trim().equals("��ط�"))
		{
			sfxhf="Y";

			//��顺�ط����ڡ��Ƿ���ȷ
			if (xchfsjstr==null || xchfsjstr.equals(""))
			{
				out.print("<BR>��š�"+row+"�����󣡡��ط����ڡ�����Ϊ�գ�");
				return;
			}
			else{
				try{
					xchfsj=java.sql.Date.valueOf(xchfsjstr.trim());
				}
				catch (Exception e){
					out.print("<BR>��š�"+row+"�����󣡻ط����ڡ�"+xchfsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
					return;
				}
			}
		}
		else if (sfxhfstr.trim().equals("����ط�"))
		{
			sfxhf="N";
			xchfsjstr="";
		}
		else{
			out.print("<BR>��š�"+row+"�����󣡡��Ƿ���طá�����ȷ��ֻ���ǡ���طá�����طá�����֮һ��");
			return;
		}


		int count=0;
		//��顺ҵ��Ա���Ƿ���ȷ
		if (ywy==null || ywy.equals(""))
		{
		}
		else{
			sql="select count(*)";
			sql+=" from  sq_yhxx";
			sql+=" where ssfgs='"+fgsbh+"' and zwbm='19' and yhmc='"+ywy.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.print("<BR>��š�"+row+"�����ѣ�ҵ��Ա��"+ywy+"�������ڣ�");
//				return;
			}
		}

		//��顺Ԥ��װ��ʱ�䡻�Ƿ���ȷ
		if (yjzxsjstr==null || yjzxsjstr.equals(""))
		{
		}
		else{
			try{
				yjzxsj=java.sql.Date.valueOf(yjzxsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"������Ԥ��װ��ʱ�䡺"+yjzxsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}


		//��顺�ͻ���Դ���ʡ��Ƿ���ȷ
		if (khzyxz==null || khzyxz.equals(""))
		{
		}
		else{
			sql="select count(*)";
			sql+=" from  dm_khzyxzbm";
			sql+=" where khzyxz='"+khzyxz+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.print("<BR>��š�"+row+"�����󣡿ͻ���Դ���ʡ�"+khzyxz+"�������ڣ�");
				return;
			}
		}

		//��顺¼���ˡ��Ƿ���ȷ
		if (lrr==null || lrr.equals(""))
		{
			out.print("<BR>��š�"+row+"�����󣡡�¼���ˡ�����Ϊ�գ�");
			return;
		}

		//��顺¼��ʱ�䡻�Ƿ���ȷ
		if (lrsjstr==null || lrsjstr.equals(""))
		{
			out.print("<BR>��š�"+row+"�����󣡡�¼��ʱ�䡻����Ϊ�գ�");
			return;
		}
		else{
			try{
				lrsj=java.sql.Date.valueOf(lrsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"������¼��ʱ�䡺"+lrsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%> 
        <input name="row" type="hidden" value="<%=row%>">
      </td>
      <td><%=khxm%> 
        <input name="khxm" type="hidden" value="<%=khxm%>">
      </td>
      <td><%=xbstr%> 
        <input name="xb" type="hidden" value="<%=xb.trim()%>">
      </td>
      <td><%=lxfs%>
        <input name="lxfs" type="hidden" value="<%=lxfs%>" >
      </td>
      <td><%=qtdh%>
        <input name="qtdh" type="hidden" value="<%=qtdh%>" >
      </td>
	  <td><%=cqbmstr%>
        <input name="cqbm" type="hidden" value="<%=cqbm%>" >
      </td>
	  <td><%=xqbm%>
        <input name="xqbm" type="hidden" value="<%=xqbm%>" >
      </td>
	  <td><%=louhao%>
        <input name="louhao" type="hidden" value="<%=louhao%>" >
      </td>
	  <td><%=fwdz%>
        <input name="fwdz" type="hidden" value="<%=fwdz%>" >
      </td>
      <td><%=fwmj%>
        <input name="fwmj" type="hidden" value="<%=fwmj%>" >
      </td>
 	  <td > <%=sfxhfstr%>
        <input name="sfxhf" type="hidden" value="<%=sfxhf%>" >
      </td>
	  <td > <%=xchfsjstr%>
        <input name="xchfsj" type="hidden" value="<%=xchfsjstr.trim()%>" >
      </td>
	   <td > <%=ywy%>
        <input name="ywy" type="hidden" value="<%=ywy%>" >
      </td>
	  <td><%=fgsmc%>
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>" >
      </td> 
	  <td><%=yjzxsjstr%>
        <input name="yjzxsj" type="hidden" value="<%=yjzxsjstr%>" >
      </td> 


	  <td><%=khzyxz%>
        <input name="khzyxz" type="hidden" value="<%=khzyxz%>" >
      </td> 


	  <td><%=lrr%>
        <input name="lrr" type="hidden" value="<%=lrr%>" >
      </td> 
	  <td><%=lrsjstr%>
        <input name="lrsj" type="hidden" value="<%=lrsjstr%>" >
      </td> 
	  <td><%=lrbmstr%>
        <input name="lrbm" type="hidden" value="<%=lrbm%>" >
      </td> 
	  <td><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td> 
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
	return;
}
finally 
{
	try{
		f.close();
		if (f != null) f.close(); 
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
        <input type="button"  value="����" onClick="f_do(editform)">
      </td>
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
	return true;
}
//-->
</SCRIPT>
