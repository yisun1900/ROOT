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


<%
String yhmc=(String)session.getAttribute("yhmc");
String lrdw=(String)session.getAttribute("dwbh");

String dqbm=null;
String fgsbh=null;
String kh_dwbh=null;
double kh_zjxje=0;
double kh_zhzjxje=0;

double kh_zqguanlif=0;
double kh_glfbfb=0;
double kh_guanlif=0;

double kh_zqzjxguanlif=0;
double kh_zjxguanlif=0;

double kh_suijin=0;
double kh_suijinbfb=0;
double kh_zjxsuijin=0;

double kh_kglf=0;
double kh_kqtk=0;

String cxhdbmxq=null;
String cxhdbmzh=null;
String cxhdbm=null;
String kh_sjsjsbz=null;
String kh_gdjsjd=null;
String kh_gcjdbm=null;
String kh_zjxxh=null;
String kh_zjxm=null;
String kh_qyrq=null;

double kh_wdzgce=0;
double kh_qye=0;
double kh_zkl=0;
double kh_zjxzkl=0;
String kh_hth=null;
String kh_khxm=null;
String kh_lxfs=null;
String kh_sgd=null;
String kh_sgbz=null;
String kh_fwdz=null;
String kh_sjs=null;
String kh_jzbz=null;
String kh_zjxwcbz=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

double zjxzkl=10;
double cxhdzjxzkl=10;
double glfzkl=10;
double cxhdglfzkl=10;

String zklx=null;



String zjxxh=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,zjxje,zhzjxje,zqguanlif,guanlif,glfbfb,zqzjxguanlif,zjxguanlif  ,suijin,suijinbfb,zjxsuijin  ,kglf,kqtk";
	ls_sql+=" ,cxhdbm,cxhdbmxq,cxhdbmzh,sjsjsbz,gdjsjd,gcjdbm,zjxxh,zjxm,qyrq";
	ls_sql+=" ,wdzgce,qye,zkl,zjxzkl,hth,khxm,lxfs,sgd,sgbz,fwdz,sjs,jzbz,zjxwcbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		kh_dwbh=cf.fillNull(rs.getString("dwbh"));
		kh_zjxje=rs.getDouble("zjxje");
		kh_zhzjxje=rs.getDouble("zhzjxje");
		kh_zqguanlif=rs.getDouble("zqguanlif");
		kh_guanlif=rs.getDouble("guanlif");
		kh_glfbfb=rs.getDouble("glfbfb");
		kh_zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		kh_zjxguanlif=rs.getDouble("zjxguanlif");


		kh_suijin=rs.getDouble("suijin");
		kh_suijinbfb=rs.getDouble("suijinbfb");
		kh_zjxsuijin=rs.getDouble("zjxsuijin");

		kh_kglf=rs.getDouble("kglf");
		kh_kqtk=rs.getDouble("kqtk");

		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		kh_sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
		kh_gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		kh_gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//���̽���
		kh_zjxxh=cf.fillNull(rs.getString("zjxxh"));
		kh_zjxm=cf.fillNull(rs.getString("zjxm"));
		kh_qyrq=cf.fillNull(rs.getDate("qyrq"));


		kh_wdzgce=rs.getDouble("wdzgce");
		kh_qye=rs.getDouble("qye");
		kh_zkl=rs.getDouble("zkl");
		kh_zjxzkl=rs.getDouble("zjxzkl");
		kh_hth=cf.fillNull(rs.getString("hth"));
		kh_khxm=cf.fillNull(rs.getString("khxm"));
		kh_lxfs=cf.fillNull(rs.getString("lxfs"));
		kh_sgd=cf.fillNull(rs.getString("sgd"));
		kh_sgbz=cf.fillNull(rs.getString("sgbz"));
		kh_fwdz=cf.fillNull(rs.getString("fwdz"));
		kh_sjs=cf.fillNull(rs.getString("sjs"));
		kh_jzbz=rs.getString("jzbz");
		kh_zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));

	}
	else{
		rs.close();
		ps.close();

		out.println("���󣡿ͻ�������");
		return;
	}
	rs.close();
	ps.close();


	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+kh_zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=cf.fillNull(rs.getString("sfwc"));
	}
	rs.close();
	ps.close();

	if (sfwc.equals("N"))//N��δ��ɣ�Y�������
	{
		out.println("<font color='#FF0033' SIZE=2px><strong>����������["+kh_zjxxh+"]¼��δ��ɣ������޸������</strong></font>");
		return;
	}

	if (kh_gcjdbm.equals("5"))
	{
		out.println("���󣡿ͻ�����ᣬ�������޸�");
		return;
	}
	if (kh_sjsjsbz.equals("2"))//0��δ���㣻1��ǩ�����㣻2���깤����
	{
		out.println("�������ʦ�ѽ��㣬�������޸�");
		return;
	}
	if (kh_gdjsjd.equals("1"))//0��δ���㣻1���ѽ���
	{
		out.println("����ʩ�����ѽ��㣬�������޸�");
		return;
	}

	if (kh_zjxwcbz.equals("2"))
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("����[������]����ɣ�������[¼��������]���뵽��ά������ȥ�޸�");
		window.location="EditCrm_zjxdj.jsp?zjxxh=<%=kh_zjxxh%>";
		//-->
		</SCRIPT>
		<%
		return;
	}

	//����Ƿ�����ʹ������ϸ������++++++++++++++++
	double dzbj=0;
	//��ʼ��
	dzbj.Dzbj getdzbj=new dzbj.Dzbj();
	//��ȡ���ӱ��۽��
	if (kh_zjxxh.equals(""))
	{
		dzbj=getdzbj.getBjje(conn,khbh,"hmy");
	}
	else{
		dzbj=getdzbj.getZjxHBjje(conn,khbh,kh_zjxxh,"hmy");
	}

	if ( (int)(kh_wdzgce+kh_zjxje)!=(int)dzbj )
	{
		out.println("<font color='#FF0033' SIZE=2px><strong>���ѣ�������ԭ���ۣ��ۼ������"+cf.formatDouble(kh_wdzgce+kh_zjxje)+"�������ڡ����ӱ����ܶ�:"+cf.formatDouble(dzbj)+"��<BR>��¼��(����ϸ)������</strong></font>");
		return;
	}
	//����Ƿ�����ʹ������ϸ������++++++++++++++++
	

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	//�ۿ�����  1��ȫ���ۿۣ�2�������ۿ�
	ls_sql="select zklx ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
	}
	rs.close();
	ps.close();

	ls_sql="select glfzk,zjxhdzk";
	ls_sql+=" from  crm_cxhdzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdglfzkl=rs.getDouble("glfzk");//����ѻ�ۿ�
		cxhdzjxzkl=rs.getDouble("zjxhdzk");//�������ۿ�
	}
	rs.close();
	ps.close();



	if (zklx.equals("1"))//1��ȫ���ۿۣ�2�������ۿ�
	{
		zjxzkl=kh_zjxzkl;//�����ۿ�
		glfzkl=kh_zjxzkl;//������ۿ�
	}
	else if (zklx.equals("2"))//1��ȫ���ۿۣ�2�������ۿ�
	{
		zjxzkl=kh_zjxzkl;//�����ۿ�

		ls_sql="SELECT dxzkl";
		ls_sql+=" FROM bj_sfxmmx ";
		ls_sql+=" where khbh='"+khbh+"' and sflx='5'";//1��ֱ�ӷѰٷֱȣ�2���̶����(�ɸ�)��3��˰��(�ٷֱ�)��4���̶����(���ɸ�)��5�������(�ٷֱ�)
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			glfzkl=rs.getDouble("dxzkl");//������ۿ�
		}
		rs.close();
		ps.close();
	}
	else{
		zjxzkl=10;//�����ۿ�
		glfzkl=10;//������ۿ�
	}


	//���������
	ls_sql="select NVL(max(substr(zjxxh,8,2)),0)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	zjxxh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#000033" style='FONT-SIZE: 14px'>
<form method="post" action="" name="insertform" target="_blank">

<%
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�������</td>
	<td  width="9%">�����׶�</td>
	<td  width="11%">��������-��ǰ</td>
	<td  width="11%">��������-�ۺ�</td>
	<td  width="10%">˰��</td>
	<td  width="10%">�����-��ǰ</td>
	<td  width="10%">�����-�ۺ�</td>
	<td  width="10%">�۹����</td>
	<td  width="10%">��������</td>
	<td  width="11%">����ʱ��</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT  crm_zjxdj.zjxxh,zjxfsjdmc,crm_zjxdj.zjje,crm_zjxdj.jzjje,crm_zjxdj.zjxsuijin,crm_zjxdj.zqguanlif,crm_zjxdj.zhguanlif,crm_zjxdj.kglf,crm_zjxdj.kqtk,fssj";
	ls_sql+=" FROM crm_zjxdj,dm_zjxfsjd  ";
    ls_sql+=" where crm_zjxdj.zjxfsjd=dm_zjxfsjd.zjxfsjd(+)";
    ls_sql+=" and crm_zjxdj.khbh='"+khbh+"'";
    ls_sql+=" order by crm_zjxdj.zjxxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/gcgl/zjx/ViewCrm_zjxdj.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

	%>
	</table>
	<%
}
%> 


      <div align="center"><font color="#FFFFCC">��¼����������Ϣ<b>(��������ţ�<%=zjxxh%>)</b></font></div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
              <div align="right"><font color="#0000FF">��ͬ��</font></div>              </td>
              <td width="31%"> <%=kh_hth%> </td>
              <td width="21%"> 
              <div align="right"><font color="#0000CC">�ͻ�����</font></div>              </td>
              <td width="29%"> <%=kh_khxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
              <div align="right"><font color="#0000CC">���ݵ�ַ</font></div>              </td>
              <td width="31%"><%=kh_fwdz%> </td>
              <td width="21%"> 
              <div align="right"><font color="#0000CC">���̵���</font></div>              </td>
              <td width="29%"><%=kh_zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">ǩԼ����</font></td>
              <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+kh_dwbh+"'",kh_dwbh,false);
%></td>
              <td width="21%" align="right"><font color="#0000CC">���ʦ</font></td>
              <td width="29%"><%=kh_sjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
              <div align="right"><font color="#0000FF">ʩ����</font></div>              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+kh_sgd+"'",kh_sgd,false);
%> </td>
              <td width="21%"> 
              <div align="right"><font color="#0000CC">ʩ������</font></div>              </td>
              <td width="29%"> <%=kh_sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">����ԭ����</font></td>
              <td width="31%"><%=kh_wdzgce%></td>
              <td align="right" width="21%"><font color="#0000CC">����ǩԼ��</font></td>
              <td width="29%"><%=kh_qye%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">����������-��ǰ</font></td>
              <td width="31%"><%=kh_zjxje%></td>
              <td align="right" width="21%"><font color="#0000CC">����������-�ۺ�</font></td>
              <td width="29%"><%=kh_zhzjxje%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" height="2"><font color="#0000CC">��ͬ˰��</font></td>
              <td width="31%" height="2"><%=kh_suijin%></td>
              <td align="right" width="21%" height="2"><font color="#0000CC">������˰��</font></td>
              <td width="29%" height="2"><%=kh_zjxsuijin%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" height="2"><font color="#0000CC">��ͬ�����-��ǰ</font></td>
              <td width="31%" height="2"><%=kh_zqguanlif%></td>
              <td align="right" width="21%" height="2"><font color="#0000CC">��ͬ�����-�ۺ�</font></td>
              <td width="29%" height="2"><%=kh_guanlif%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" height="2"><font color="#0000CC">���������-��ǰ</font></td>
              <td width="31%" height="2"><%=kh_zqzjxguanlif%></td>
              <td align="right" width="21%" height="2"><font color="#0000CC">���������-�ۺ�</font></td>
              <td width="29%" height="2"><%=kh_zjxguanlif%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">�ۼƼ�������</font></td>
              <td width="31%"><%=kh_kglf%></td>
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">�ۼƼ����������</font></td>
              <td width="29%"><%=kh_kqtk%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">�ۿ�����</font></td>
              <td width="31%"> <%
	cf.radioToken(out,"0+���ۿ�&1+ȫ���ۿ�&2+�����ۿ�",zklx,true);
%> </td>
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">��ͬ�ۿ�</font></td>
              <td width="29%"><font color="#0000CC"><%=kh_zkl%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">�μӹ�˾�����</font></td>
              <td colspan="3"><%=cxhdbm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">�μ�С�������</font></td>
              <td colspan="3"><%=cxhdbmxq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">�μ�չ������</font></td>
              <td colspan="3"><%=cxhdbmzh%></td>
            </tr>
  </table>
    <BR>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
 			<tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="8" bgcolor="#FFFFCC"><b><font color="#3333FF" size="4">ע�⣺һ��Ҫ���<font color="#FF3333">����ɡ�</font>��ť���Զ�����������</font></b></td>
            </tr>
        
            <tr bgcolor="#FFFFFF">
              <td colspan="2" align="center" bgcolor="#E8E8FF"><strong>���̷�</strong></td>
              <td width="1%" rowspan="7" align="right" bgcolor="#000033">&nbsp;</td>
              <td colspan="2" align="center" bgcolor="#E8E8FF"><strong>�����</strong></td>
              <td width="1%" rowspan="7" align="center" bgcolor="#000033">&nbsp;</td>
              <td colspan="2" align="center" bgcolor="#E8E8FF"><strong>˰��</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="2" align="center" bgcolor="#FFFFFF"><p><font color="#CC0066"><strong>����Ϊ��������Ϊ��</strong></font></p></td>
              <td width="16%" align="right"><font color="#0000CC">����Ѱٷֱ�</font></td>
              <td width="18%"><%=kh_glfbfb%>%</td>
              <td width="11%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">˰��ٷֱ�</font></td>
              <td width="18%" bgcolor="#FFFFFF"><font color="#0000CC"><%=kh_suijinbfb%>%</font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">������-��ǰ</font></td>
              <td bgcolor="#FFFFFF"><p><font color="#CC0066"><strong>
                <input name="zjje" type="text" value="0" size="10" maxlength="17" readonly>
              </strong></font></p>              </td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������-��ǰ</font></td>
              <td><input name="zqguanlif" type="text" value="0" size="10" maxlength="17"  readonly></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">������</font></td>
              <td bgcolor="#FFFFFF"><input name="zjxsuijin" type="text" value="0" size="8" maxlength="17" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">�ۿ�</font></td>
              <td bgcolor="#FFFFFF"><font color="#CC0066"><strong>
              <input type="text" name="zjxzkl" size="10" maxlength="8" value="<%=zjxzkl%>" readonly>
              </strong></font></td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�ۿ�</font></td>
              <td><font color="#CC0066"><strong>
                <input type="text" name="glfzkl" size="10" maxlength="8" value="<%=glfzkl%>" readonly>
              </strong></font></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>�����</td>
              <td bgcolor="#FFFFFF"><input type="text" name="sjjmje" size="8" maxlength="17" value="0" ></td>
            </tr>




            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">��ۿ�</font></td>
              <td width="20%" bgcolor="#FFFFFF"><font color="#CC0066"><strong>
              <input type="text" name="cxhdzjxzkl" size="10" maxlength="8" value="<%=cxhdzjxzkl%>" readonly>
              </strong></font></td>
              <td width="16%" align="right"><font color="#FF0000">*</font><font color="#0000CC">��ۿ�</font></td>
              <td width="18%"><font color="#CC0066"><strong>
                <input type="text" name="cxhdglfzkl" size="10" maxlength="8" value="<%=cxhdglfzkl%>" readonly>
              </strong></font></td>
              <td colspan="2" align="center" bgcolor="#E8E8FF"><strong>��������</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">������-�ۺ�</font></td>
              <td bgcolor="#FFFFFF"><input name="jzjje" type="text" value="0" size="10" maxlength="17" readonly></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">������-�ۺ�</font></td>
              <td><input type="text" name="zhguanlif" size="10" maxlength="17" readonly></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>�۹����</td>
              <td bgcolor="#FFFFFF"><input type="text" name="kglf" value="0" size="8" maxlength="17" >
                <font color="#CC0066"><strong>Ϊ����</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>�����</td>
              <td bgcolor="#FFFFFF"><input type="text" name="zjxjme" size="10" maxlength="17" value="0" ></td>
              <td align="right"><font color="#FF0000">*</font>�����</td>
              <td><input type="text" name="glfjmje" size="10" maxlength="17" value="0" ></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>��������</td>
              <td bgcolor="#FFFFFF"><input type="text" name="kqtk" value="0" size="8" maxlength="17" >
                <font color="#CC0066"><strong>Ϊ����</strong></font></td>
            </tr>
  </table>
  <BR>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
                            <tr bgcolor="#FFFFFF">
                              <td align="right"><font color="#FF0000">*</font>��������׶�</td>
                              <td><select name="zjxfsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                                <option value=""></option>
                                <%
	cf.selectItem(out,"select zjxfsjd,zjxfsjdmc from dm_zjxfsjd order by zjxfsjd","");
%>
                              </select></td>
                              <td rowspan="5" align="right" width="21%"><font color="#FF0000">*</font>������ԭ�� 
                                <div align="right"></div>
                        <div align="right"></div>              </td>
                              <td rowspan="5" width="29%"> 
                                <select name="zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                                  <%
	cf.selectItem(out,"select zjxyybm,zjxyymc from dm_zjxyybm order by zjxyybm","");
%> 
                                </select>              </td>
                            </tr>
                        <tr bgcolor="#FFFFFF">
                          <td align="right"><font color="#FF0000">*</font>�������ʱ��</td>
                          <td><input type="text" name="fssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
                        </tr>
                    <tr bgcolor="#FFFFFF">
                      <td align="right"><font color="#FF0000">*</font>��������ɱ�־</td>
                      <td><input type="radio" name="zjxwcbz" value="1">
δ���
  <input type="radio" name="zjxwcbz" value="2">
��� </td>
                    </tr>
                <tr bgcolor="#FFFFFF">
                  <td align="right"><font color="#FF0000">*</font><font color="#0000FF">¼����</font></td>
                  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="17" readonly></td>
                </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">¼��ʱ��</font></td>
              <td width="31%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>������˵��</td>
              <td colspan="3"> 
                <textarea name="zjxyysm" cols="74" rows="3"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="lrdw" value="<%=lrdw%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" readonly>
                <input type="hidden" name="zjxxh" value="<%=zjxxh%>" readonly>
                <input type="button"  value="����" onClick="f_do(insertform)" name="bc">
                <input type="button"  value="ѡ������Ŀ" onClick="f_xzxm(insertform)" name="lr" disabled>
                <input type="button"  value="ѡ�����շ�" onClick="f_ewlr(insertform)" name="ewlr" disabled>
                <input type="button"  value="�޸������շ�" onClick="f_ewck(insertform)" name="xgsf" disabled>
                <input type="button"  value="�޸��Թ�����" onClick="f_xgzgzc(insertform)" name="xgzgzc" disabled>
                <input type="reset"  value="����">
                <P>
                  <input type="button"  value="���������" onClick="f_wc(insertform)" name="wc" disabled>
                  <input type="button"  value="Ԥ�����±���" onClick="f_dybj(insertform)" name="ck" disabled>
                </td>
            </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("��ѡ��[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxfsjd)=="") {
		alert("������[��������׶�]��");
		FormName.zjxfsjd.focus();
		return false;
	}
	if(	javaTrim(FormName.fssj)=="") {
		alert("������[�������ʱ��]��");
		FormName.fssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fssj, "�������ʱ��"))) {
		return false;
	}
	if(	!selectChecked(FormName.zjxyybm)) {
		alert("������[������ԭ��]��");
		FormName.zjxyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.zjje)=="") {
		alert("��ѡ��[��ǰ���������]��");
		FormName.zjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjje, "��ǰ���������"))) {
		return false;
	}
	if(	javaTrim(FormName.jzjje)=="") {
		alert("��ѡ��[�ۺ����������]��");
		FormName.jzjje.focus();
		return false;
	}
	if(!(isFloat(FormName.jzjje, "�ۺ����������"))) {
		return false;
	}

	if(	javaTrim(FormName.zjxsuijin)=="") {
		alert("��ѡ��[������˰��]��");
		FormName.zjxsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxsuijin, "������˰��"))) {
		return false;
	}

	if(	javaTrim(FormName.zqguanlif)=="") {
		alert("��ѡ��[��ǰ����������]��");
		FormName.zqguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.zqguanlif, "��ǰ����������"))) {
		return false;
	}
	if(	javaTrim(FormName.zhguanlif)=="") {
		alert("��ѡ��[�ۺ�����������]��");
		FormName.zhguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.zhguanlif, "�ۺ�����������"))) {
		return false;
	}


	if(	javaTrim(FormName.zjxjme)=="") {
		alert("������[����������]��");
		FormName.zjxjme.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxjme, "����������"))) {
		return false;
	}
	if(	javaTrim(FormName.glfjmje)=="") {
		alert("������[����Ѽ����]��");
		FormName.glfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.glfjmje, "����Ѽ����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjjmje)=="") {
		alert("������[˰������]��");
		FormName.sjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmje, "˰������"))) {
		return false;
	}


	if(	javaTrim(FormName.kglf)=="") {
		alert("��ѡ��[�۹����]��");
		FormName.kglf.focus();
		return false;
	}
	if(!(isFloat(FormName.kglf, "�۹����"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") 
	{
		alert("��ѡ��[��������]��");
		FormName.kqtk.focus();
		return false;
	}

	if(!(isFloat(FormName.kqtk, "��������"))) 
	{
		return false;
	}

	if(	!radioChecked(FormName.zjxwcbz)) {
		alert("��ѡ��[��������ɱ�־]��");
		FormName.zjxwcbz[0].focus();
		return false;
	}


	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxyysm)=="") {
		alert("������[������˵��]��");
		FormName.zjxyysm.focus();
		return false;
	}

	

	
	FormName.action="SaveInsertCrm_zjxdj.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ewlr.disabled=false;
	FormName.xgsf.disabled=false;
	FormName.xgzgzc.disabled=false;
	FormName.ck.disabled=false;
	FormName.wc.disabled=false;

	return true;
}

function f_wc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="endZjx.jsp";

	FormName.submit();
	return true;
}

function f_lrfj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	FormName.submit();
	return true;
}

function f_xgfj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	FormName.submit();
	return true;
}
function f_xzxm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}

	FormName.submit();
	return true;
}
function f_dybj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxHList.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxHList.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}

function f_ewlr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}

function f_ewck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	FormName.submit();
	return true;
}

function f_xmpx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		winOpen("/gcgl/zjx/dzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>",900,600,'YES',"NO");
	}
	else{
		winOpen("/gcgl/zjx/dzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>",900,600,'YES',"NO");
	}
}

function f_xgzgzc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/gcgl/zjx/dzbj/zxbjmx/xgzgzc.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
