<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

<style type="text/css">
<!--
.STYLE3 {font-size: 24px; font-weight: bold;}
-->
</style>
</head> 
<body> 
<object id='WebBrowser' width=0 height=0 classid='CLSID:8856F961-340A-11D0-A96B-00C04FD705A2'>
</object>

<%
String[] fkxh=request.getParameterValues("fkxh");//�վݺ��룬��ˮ��cw_khfkjl.fkxh ����
String khbh=request.getParameter("khbh");

String fklxbm=null;//�������ͱ���
String fklxmc=null;
String khxm=null;//�ͻ�����
String hth=null;//�ͻ�������=�ͻ���ͬ��
String tempskxm=null;//��ʱ�տ���Ŀ�������ϳ��տ���Ŀ
String gysbh=null;//Ʒ������
double skje=0;//�տ��� cw_khfkjl.fkje
String bz=null;//��ע
double hjxx=0;//�ϼ�Сд����ʱ����
String hjdx=null;//�ϼƴ�д����ʱ����
String skr=null;//�տ���
String jkr=null;//��ͻ�������ͬ
String skrq=null;//�տ����ڣ�����ҳ�洫�����ַ���

String sjs=null;//��װ���ʦ��cw_khfkjl.sjs
//פ����Ϲ��ʣ������ĸ���ͬ�Ŀ������Ͳ��ĸ���ͬ�ı�jc_jjdd.clgw,jc_cgdd.clgw,jc_zcdd.clgw,jc_mmydd.clgw
String clgw_o="&nbsp;";
//չ���Ҿӹ��ʣ������ĸ���ͬ�Ŀ������Ͳ��ĸ���ͬ�ı�jc_jjdd.ztjjgw,jc_cgdd.ztjjgw,jc_zcdd.ztjjgw,jc_mmydd.ztjjgw
String ztjjgw="&nbsp;";
String clgw=null;//clgw_o+ztjjgw
//�Ҿ����ʦ�������ĸ���ͬ�Ŀ������Ͳ��ĸ���ͬ�ı�jc_jjdd.jjsjs,jc_cgdd.jjsjs,jc_zcdd.jjsjs,jc_mmydd.jjsjs
String jjsjs="&nbsp;";
String dwmc=null;//��������
String fkcsmc=null;

String temppp="";
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double allskje=0;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(distinct khbh)";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where "+cf.arrayToInSQL(fkxh,"fkxh");
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		out.println("���󣡲���ͬһ�ͻ��վ�");
		return;
	}

	ls_sql="select sksj,khbh";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where fkxh='"+fkxh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		skrq=cf.fillNull(rs.getDate("sksj"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,hth,dwmc,sjs";
	ls_sql+=" from crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		hth=cf.fillNull(rs.getString("hth"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sjs=cf.fillNull(rs.getString("sjs"));
	}
	rs.close();
	ps.close();


%> 
  <table width="100%" border="0">
    <tr> 
      <td> 
      <table width="100%" border="0" align="center" style="FONT-SIZE:15" height="40">
        <tr valign="bottom"> 
          <td > 
            <table width="100%" border="0" align="center" style="FONT-SIZE:15" >
          
          <tr>
            <td height="25">��ͬ��ţ�<u>&nbsp;<%=hth%>&nbsp;</u></td>
            <td align="center" class="STYLE3" >ר���վ�</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
          <td width="39%" height="25">�ͻ�������<u><%=khxm%>&nbsp;&nbsp;</u></td>
          <td width="31%" >�տ����ڣ�<u>&nbsp;<%=skrq%>&nbsp;</u></td>
                <td width="30%">֧Ʊ�ţ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
          </tr>
        </table>
		  </td>
        </tr>
        </table>
        
      <table width="100%" border="1" cellspacing="0" bgcolor="#FFFFFF"  style="FONT-SIZE:13">
        <tr align="center" height="28"> 
          <td width="16%">�տ����</td>
          <td width="58%">�տ���Ŀ</td>
          <td width="26%">�տ���</td>
        </tr>
        <%

	for (int i=0;i<fkxh.length ;i++ )
	{
		temppp="";
		String xsfklx="";

		ls_sql="select cw_khfkjl.fklxbm,fklxmc,fkje,bz,skr,sksj,gysbh,cw_fkcs.fkcsmc";
		ls_sql+=" from cw_khfkjl,cw_fklxbm,cw_fkcs ";
		ls_sql+=" where cw_khfkjl.fklxbm=cw_fklxbm.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) and cw_khfkjl.fkxh='"+fkxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			fklxbm=cf.fillNull(rs.getString("fklxbm"));
			fklxmc=cf.fillNull(rs.getString("fklxmc"));
			fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
			skje=rs.getDouble("fkje");
			bz=cf.fillHtml(rs.getString("bz"));
			skr=cf.fillNull(rs.getString("skr"));
			skrq=cf.fillNull(rs.getDate("sksj"));
			gysbh=cf.fillNull(rs.getString("gysbh"));
		}
		rs.close();
		ps.close();

		allskje+=skje;

	//�ж��տ�����
		String bm="";
		if (fklxbm.equals("21"))
		{
			ls_sql="select jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.pdgc";
			ls_sql+=" from jc_mmydd";
			ls_sql+=" where jc_mmydd.pdgcmc='"+gysbh+"' and jc_mmydd.khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				clgw_o=cf.fillHtml(rs.getString("clgw"));
				ztjjgw=cf.fillHtml(rs.getString("ztjjgw"));
				bm=cf.fillNull(rs.getString("pdgc"));
			}
			rs.close();
			ps.close();

			xsfklx="ľ�ţ�"+bm;
		}
		else if (fklxbm.equals("22"))
		{
			ls_sql="select jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.cgsjs,jc_cgdd.pdgc";
			ls_sql+=" from cw_khfkjl,sq_gysxx,jc_cgdd";
			ls_sql+=" where cw_khfkjl.gysbh=sq_gysxx.gysmc and sq_gysxx.gysbh=jc_cgdd.pdgc";
			ls_sql+=" and cw_khfkjl.gysbh='"+gysbh+"' and cw_khfkjl.khbh='"+khbh+"' and jc_cgdd.khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				clgw_o=cf.fillHtml(rs.getString("clgw"));
				ztjjgw=cf.fillHtml(rs.getString("ztjjgw"));
				jjsjs=cf.fillNull(rs.getString("cgsjs"));
				bm=cf.fillNull(rs.getString("pdgc"));
			}
			rs.close();
			ps.close();

			xsfklx="����"+bm;
		}
		else if (fklxbm.equals("23"))
		{
			ls_sql="select jc_zcdd.clgw,jc_zcdd.ztjjgw,zcdlbm,zcxlbm";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where jc_zcdd.ppbm='"+gysbh+"' and jc_zcdd.khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				clgw_o=cf.fillHtml(rs.getString("clgw"));
				ztjjgw=cf.fillHtml(rs.getString("ztjjgw"));
				temppp=cf.fillNull(rs.getString("zcdlbm"));
				temppp=temppp+"-";
				temppp+=cf.fillNull(rs.getString("zcxlbm"));
			}
			rs.close();
			ps.close();

			xsfklx="���ģ�"+temppp+"-"+gysbh;
		}
		else if (fklxbm.equals("24"))
		{
			ls_sql="select jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.jjsjs,pdgc";
			ls_sql+=" from jc_jjdd";
			ls_sql+=" where jc_jjdd.pdgcmc='"+gysbh+"' and jc_jjdd.khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				clgw_o=cf.fillHtml(rs.getString("clgw"));
				ztjjgw=cf.fillHtml(rs.getString("ztjjgw"));
				jjsjs=cf.fillNull(rs.getString("jjsjs"));
				bm=cf.fillNull(rs.getString("pdgc"));
			}
			rs.close();
			ps.close();

			xsfklx="�Ҿߣ�"+bm;
		}
		else if (fklxbm.equals("11"))//11����װ�21:ľ�ţ�22:����23:���ģ�24���Ҿ�
		{
			if (fkcsmc.equals(""))
			{
				xsfklx="��װ��";
			}
			else{
				xsfklx="��װ"+fkcsmc;
			}
		}
		else{
			xsfklx=fklxmc;
		}

		%> 
        <tr height="26"> 
          <td ><%=fkxh[i]%></td>
		  <td ><%=xsfklx%></td>
          <td ><%=skje%></td>
        </tr>
        <%

		if (i>=5)
		{
			break;
		}
	}

	for (int i=fkxh.length;i<6;i++ )
	{
		%> 
        <tr height="26"> 
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
        </tr>
        <%
	}


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
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
        <tr > 
          <td height="28" align="center">�� ��</td>
          <td height="28">��д���ϼƣ�<%=cf.NumToRMBStr(allskje)%></td>
          <td height="28">Сд���ϼƣ�<%=allskje%>Ԫ</td>
        </tr>
      </table>
        
      </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:15">
	<tr> 
	<td width="37%" height="25">ǩԼ���棺<%=dwmc%></td>
    <td width="27%" height="25">��װ���ʦ��<%=sjs%></td>
    <td width="36%" height="25">�Ҿӹ��ʣ�<%=ztjjgw%>/<%=clgw_o%></td>
    </tr>
	<tr>
	  <td height="25">�տλ���£�</td>
	  <td height="25">�տ��ˣ�<%=skr%></td>
	  <td height="25">�ͻ�ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
    </tr>
  </table>
  </body>
</html>


<SCRIPT language=javascript >
<!--
//	WebBrowser.ExecWB(6,6); 
//	alert("��ӡ�����ѷ�����");
//	window.close();
//-->
</SCRIPT>
