<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khbh=request.getParameter("khbh");

int count=0;

String khxm=null;
String fwdz=null;
String lxfs=null;
String xb=null;
String sjs=null;
String hth=null;
String qyrq=null;
String jgrq=null;
String dwbh=null;
String sjsbh=null;
String fgsbh=null;
String sgd=null;
String zjxm=null;
double wdzgce=0;
double qye=0;
double sjf=0;
double zcbjje=0;
double sfke=0;

double yfgckze=0;
double gckzc=0;
double zjxje=0;
double zhzjxje=0;

int fkcs=0;
double yfkbl=0;

String ssfgs=null;
String sgbz=null;
String sjsdh=null;
String bzdh=null;
String zjdh=null;
String sfzhm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String fklxbm="";
String fkxh="";
double yfkcj=0;
double yfk=0;

String fkcsmc=null;
String zjxwcbz=null;
double zkl=0;
String gckk=null;

try {
	conn=cf.getConnection();
	ls_sql="select sfzhm,zhzjxje,zjxwcbz,zkl,fkcsmc,fgsbh,sjsbh,khxm,fwdz,lxfs,xb,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,sjf,zcbjje,sfke,zjxje,sgbz,jgrq,gckk";
	ls_sql+=" from  crm_khxx,cw_fkcs";
	ls_sql+=" where khbh='"+khbh+"' and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		zhzjxje=rs.getDouble("zhzjxje");
		fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		zkl=rs.getDouble("zkl");

		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		xb=cf.fillNull(rs.getString("xb"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");
		zcbjje=rs.getDouble("zcbjje");

		sfke=rs.getDouble("sfke");
		zjxje=rs.getDouble("zjxje");
		gckk=cf.fillNull(rs.getString("gckk"));
	}
	rs.close();
	ps.close();

	if (fgsbh.equals(""))
	{
		out.println("���������ֹ�˾Ϊ��");
		return;
	}
	if (dwbh.equals(""))
	{
		out.println("������������Ϊ��");
		return;
	}
	if (sjsbh.equals(""))
	{
//		out.println("�������������Ϊ��");
//		return;
	}
	if (sjs.equals(""))
	{
//		out.println("�������ʦΪ��");
//		return;
	}

	//���ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//�೤�绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select ssfgs from sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	//�ʼ�绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11'  and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fkcs=rs.getInt(1);
	}
	rs.close();
	ps.close();
	fkcs++;

	ls_sql="select sum(yfkbl)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11'  and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yfkbl=rs.getInt(1);
	}
	rs.close();
	ps.close();


	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm not in('11','92') and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yfk=rs.getDouble(1);//����ת����
	}
	rs.close();
	ps.close();

	ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	fkxh=khbh+cf.addZero(count+1,3);


}
catch (Exception e) {
	out.print("Exception: " + e);
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

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��Ʒѽ�������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCw_sjfjssqb.jsp" name="insertform" target="_blank">
          <div align="center"></div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�ͻ����</td>
              <td width="32%"><%=khbh%></td>
              <td width="18%" align="right">��ͬ��</td>
              <td width="32%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="32%"> <%=khxm%>��<%=lxfs%>�� </td>
              <td width="18%" bgcolor="#CCFFFF"> 
                <div align="right">���֤����</div>
              </td>
              <td width="32%" bgcolor="#CCFFFF"><%=sfzhm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ݵ�ַ</td>
              <td width="32%"><%=fwdz%></td>
              <td width="18%" align="right">�ʼ�����</td>
              <td width="32%"><%=zjxm%>��<%=zjdh%>�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="18%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="32%"><%=sjs%>��<%=sjsdh%>�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">�����ֹ�˾</td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%></td>
              <td align="right" width="18%">���������</td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">ʩ����</td>
              <td width="32%"><%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
              <td width="18%" align="right">�೤</td>
              <td width="32%"><%=sgbz%>��<%=bzdh%>��</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="32%"><%=qyrq%> </td>
              <td width="18%"> 
                <div align="right">��ͬ��������</div>
              </td>
              <td width="32%"><%=jgrq%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">�ۿ���</td>
              <td width="32%" bgcolor="#E8E8FF"><%=zkl%></td>
              <td align="right" bgcolor="#E8E8FF" width="18%"><b><font color="#FF0000">���ķ�</font></b></td>
              <td bgcolor="#E8E8FF" width="32%"><b><font color="#FF0000"><%=zcbjje%>��</font></b></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><b><font color="#FF0000">Ԥ����</font></b></td>
              <td width="32%"><b><font color="#FF0000"><%=wdzgce%>��</font></b></td>
              <td width="18%" align="right"><font color="#0000FF">��ͬ���</font></td>
              <td width="32%" bgcolor="#E8E8FF"><%=qye%>��</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="18%"><font color="#0000FF">��ǰ�ۼ��������ܶ�</font></td>
              <td width="32%"><%=cf.formatDouble(zjxje)%>��</td>
              <td align="right" bgcolor="#E8E8FF" width="18%"><font color="#0000FF">�ۺ��ۼ��������ܶ�</font></td>
              <td bgcolor="#E8E8FF" width="32%"><%=cf.formatDouble(zhzjxje)%>�� 
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="18%"><font color="#0000FF">��ǰ�ۼ�Ԥ���ܶ�</font></td>
              <td width="32%"><font color="#0000FF"><%=cf.formatDouble(wdzgce+zjxje)%></font>��</td>
              <td align="right" bgcolor="#E8E8FF" width="18%"><font color="#0000FF">�ۺ��ۼƺ�ͬ���</font></td>
              <td bgcolor="#E8E8FF" width="32%"><font color="#0000FF"><%=cf.formatDouble(qye+zhzjxje)%></font>��</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><b><font color="#FF0000">��Ʒ�</font></b></td>
              <td width="32%"><b><font color="#FF0000"><%=sjf%></font></b></td>
              <td width="18%" align="right" bgcolor="#E8E8FF"><b><font color="#FF0000"></font></b></td>
              <td width="32%"><b><font color="#FF0000"></font></b></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#0000FF">���չ��̿�</font></td>
              <td width="32%"><font color="#0000FF"><%=cf.formatDouble(sfke)%>��</font> 
              </td>
              <td width="18%" align="right" bgcolor="#CCFFFF">ת��������ܽ��</td>
              <td width="32%" bgcolor="#CCFFFF"><%=(yfk-yfkcj)%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" height="2" align="right"><font color="#0000FF"><font color="#0000FF">��ǰӦ�չ������</font></font></td>
              <td width="32%" height="2"><font color="#0000FF"><font color="#0000FF"><%=cf.formatDouble(wdzgce+zjxje-sfke)%>��</font></font> 
              </td>
              <td width="18%" height="2" align="right"><font color="#0000FF"><font color="#0000FF">�ۺ�<font color="#0000FF">Ӧ�չ������</font></font></font></td>
              <td width="32%" height="2"><font color="#0000FF"><font color="#0000FF"><%=cf.formatDouble(qye+zhzjxje-sfke)%>��</font></font> 
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" height="2" align="right">��������ɱ�־</td>
              <td width="32%" height="2"><%
	cf.radioToken(out, "zjxwcbz","1+δ���&2+�����",zjxwcbz,true);
%></td>
              <td width="18%" height="2" align="right">��װ�տ�����</td>
              <td width="32%" height="2"><%=fkcsmc%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">������</td>
              <td width="32%"> 
                <input type="text" name="sqr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td align="right" width="18%">����ʱ��</td>
              <td width="32%"> 
                <input type="text" name="sqsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khbh" value="<%=khbh%>">
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sqr)=="") {
		alert("������[������]��");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.sqsj)=="") {
		alert("������[����ʱ��]��");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
