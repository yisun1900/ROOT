<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
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
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String xgjlh=null;
 
String hth=null;
String khxm=null;
String fwdz=null;
String fgsbh= null;
String fgsmc= null;
String dwbh= null;
String dwmc= null;
String sjsbh= null;
String sjs= null;
String sjsgh= null;
double wdzgce= 0;
double qye= 0;
double cdzwjmje= 0;
double suijin= 0;
double suijinbfb= 0;
double glfbfb=0;//����Ѱٷֱ�
double zqguanlif= 0;
double guanlif= 0;
double glfjmje= 0;
double sjjmje= 0;

double zqwjrqyexm= 0;
double zhwjrqyexm= 0;
String wjrqyexmsm= null;

double sjf= 0;
double glf= 0;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zklx="";


try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,fwdz,crm_khxx.fgsbh,a.dwmc fgsmc,crm_khxx.dwbh,b.dwmc dwmc,sjsbh,sjs,sjsgh,wdzgce";
	ls_sql+=" ,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif ";
	ls_sql+=" ,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,cxhdbm,cxhdbmxq,cxhdbmzh";
	ls_sql+=" from  crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where  crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		fgsmc=cf.fillNull(rs.getString("fgsmc"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sjsgh=cf.fillNull(rs.getString("sjsgh"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		cdzwjmje=rs.getDouble("cdzwjmje");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		glfbfb=rs.getDouble("glfbfb");
		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
	}
	rs.close();
	ps.close();


	int count=0;
	ls_sql="select NVL(max(substr(xgjlh,8,2)),0)";
	ls_sql+=" from  cw_cxhdxgjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	
	xgjlh=khbh+cf.addZero(count+1,2);

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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


<div align="center">�޸Ĵ�������޸ļ�¼�ţ�<%=xgjlh%>��<font color="#FF0000"><strong>
<P>
ע�⣺��Ӱ��ǩԼ��޸ġ���������󣬲��޸ġ��ͻ��ۿۡ������޸ġ��ۺ������ʹ����ۿ�</strong></font></div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="20%" align="right"><font color="#0000FF">��ͬ��</font></td>
      <td width="30%"><%=hth%> </td>
      <td width="21%" align="right"><font color="#0000FF">�ͻ�����</font></td>
      <td width="29%"><%=khxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�ֹ�˾</font></td>
      <td><%=fgsmc%> </td>
      <td align="right"><font color="#0000FF">ǩԼ����</font></td>
      <td><%=dwmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">���ʦ</font></td>
      <td><%=sjs%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">����ԭ����</font></td>
      <td><%=wdzgce%></td>
      <td align="right"><font color="#0000FF">ǩԼ��</font></td>
      <td><%=qye%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">��ͬ�����</font></td>
      <td><%=cdzwjmje%></td>
      <td align="right"><font color="#0000FF">����Ѱٷֱ�</font></td>
      <td><%=glfbfb%>%</td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">��ǰ�����</font></td>
      <td><%=zqguanlif%></td>
      <td align="right"><font color="#0000FF">�ۺ�����</font></td>
      <td><%=guanlif%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">����Ѽ����</font></td>
      <td><%=glfjmje%></td>
      <td align="right"><font color="#0000FF">˰������</font></td>
      <td><%=sjjmje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">˰��ٷֱ�</font></td>
      <td><%=suijinbfb%> % </td>
      <td align="right"><font color="#0000FF">˰��</font></td>
      <td><%=suijin%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">��ǰδ����ǩԼ����Ŀ</font></td>
      <td><%=zqwjrqyexm%></td>
      <td align="right"><font color="#0000FF">�ۺ�δ����ǩԼ����Ŀ</font></td>
      <td><%=zhwjrqyexm%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">δ����ǩԼ����Ŀ˵��</font></td>
      <td colspan="3"><%=wjrqyexmsm%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">��Ʒ�</font></td>
      <td><%=sjf%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>

  <center><b>���ӱ����ۺ�ȡ��</b></center>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
 <tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">�շ���Ŀ</td>
	<td  width="8%">�շѼ��㷽ʽ</td>
	<td  width="4%">�ٷֱ�</td>
	<td  width="4%">������λ</td>
	<td  width="4%">����</td>
	<td  width="5%">����</td>
	<td  width="6%">��ǰ���</td>
	<td  width="3%">�����ۿ�</td>
	<td  width="6%">�ۺ���</td>
	<td  width="4%">����ǩԼ��</td>
	<td  width="4%">����˰��</td>
	<td  width="4%">��������</td>
	<td  width="4%">�Ƿ�ɴ���</td>
	<td  width="3%">����ۿ�</td>
	<td  width="6%">�շ���Ŀ����</td>
	<td  width="4%">ʩ���ӽ���</td>
	<td  width="20%">��ע</td>
</tr>

 <%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT sfxmmc,DECODE(sflx,'1','����ֱ�ӷѰٷֱȣ����ɸģ�','A','����ֱ�ӷѰٷֱȣ��ɸģ�','2','�̶����(�ɸ�)','3','˰���ۺ󰴻������㣩','8','˰���ۺ��ۿۼ��㣩','4','�̶����(���ɸ�)','5','�����','6','��˾�����İٷֱ�','7','�Թ����İٷֱ�','9','���ٷֱ�����Ʒ�') sflx ";
	ls_sql+=" ,bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.jldw,TO_CHAR(bj_sfxmmx.sl) sl,TO_CHAR(bj_sfxmmx.dj) dj,bj_sfxmmx.zqsfje,TO_CHAR(bj_sfxmmx.dxzkl) dxzkl,bj_sfxmmx.sfje ";
	ls_sql+=" ,DECODE(bj_sfxmmx.sfjrqye,'1','����','2','<font color=\"#FF0000\"><B>������</B></font>') sfjrqye,DECODE(bj_sfxmmx.jrsjbz,'1','����','2','������') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','����','2','������') jrglfbz,DECODE(bj_sfxmmx.sfkdz,'N','���ɴ�','Y','�ɴ�') sfkdz,TO_CHAR(zdzk) zdzk,DECODE(sfxmlx,'1','��ӹ��̷�','2','������ط�','3','��Ʒ�','4','��˾�����ļ�ӷ�','5','���̹����','6','����˰��','7','��˾�����Ĺ����','8','��˾������˰��','A','�Թ����Ĺ����','B','�Թ�����˰��','C','�Թ����ļ�ӷ�','D','ˮ��·','9','����') sfxmlx,DECODE(bj_sfxmmx.sfcysgdjs,'N','��','Y','��') sfcysgdjs,bj_sfxmmx.bz";
	ls_sql+=" FROM bj_sfxmmx  ";
	ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
	ls_sql+=" order by bj_sfxmmx.sfxmbm";

	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%>
</table>


<BR>
<form method="post" action="SaveInsertCw_cxhdxgjl1.jsp" name="insertform" target="_blank">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�޸�ǰ��˾�����</font></td>
      <td colspan="3"><%=cxhdbm%>
      <input type="hidden" name="xgqcxhd" value="<%=cxhdbm%>" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�޸�ǰС�������</font></td>
      <td colspan="3"><%=cxhdbmxq%>
      <input type="hidden" name="xgqcxhdbmxq" value="<%=cxhdbmxq%>" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�޸�ǰչ������</font></td>
      <td colspan="3"><%=cxhdbmzh%>
      <input type="hidden" name="xgqcxhdbmzh" value="<%=cxhdbmzh%>" ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�޸ĺ�˾�����</td>
      <td colspan="3"> 
        <select name="xghcxhd" style="FONT-SIZE:12PX;WIDTH:530PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(����'||jc_cxhd.dj||'��)' c2 from jc_cxhd where jc_cxhd.fgsbh='"+fgsbh+"' and jc_cxhd.hdlx in('1','2') order by jc_cxhd.cxhdmc","");
%> 
        </select>      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�޸ĺ�С�������</td>
      <td colspan="3"> 
        <select name="xghcxhdbmxq" style="FONT-SIZE:12PX;WIDTH:530PX" onKeyUp="keyGo(yhyy)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(����'||jc_cxhd.dj||'��)' c2 from jc_cxhd where jc_cxhd.fgsbh='"+fgsbh+"' and jc_cxhd.hdlx='3'  order by jc_cxhd.cxhdmc","");
%> 
        </select>      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�޸ĺ�չ������</td>
      <td colspan="3"> 
        <select name="xghcxhdbmzh" style="FONT-SIZE:12PX;WIDTH:530PX" onKeyUp="keyGo(yhyy)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(����'||jc_cxhd.dj||'��)' c2 from jc_cxhd where jc_cxhd.fgsbh='"+fgsbh+"' and jc_cxhd.hdlx='4'  order by jc_cxhd.cxhdmc","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000FF">¼����</font></td>
      <td width="30%"> 
      <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="21%"><font color="#FF0000">*</font><font color="#0000FF">¼��ʱ��</font></td>
      <td width="29%"> 
      <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000FF">¼�벿��</font></td>
      <td width="30%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
      </select>      </td>
      <td align="right" width="21%">&nbsp;</td>
      <td width="29%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font>��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
	  <input type="hidden" name="khbh" value="<%=khbh%>" >
	  <input type="hidden" name="khxm" value="<%=khxm%>" >
	  <input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
        <input type="hidden" name="xgjlh" value="<%=xgjlh%>"></td>
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
	if(	javaTrim(FormName.xgjlh)=="") {
		alert("������[�޸ļ�¼��]��");
		FormName.xgjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}


	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("������[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}

	if(	javaTrim(FormName.bz)=="") {
		alert("��ѡ��[��ע]��");
		FormName.bz.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
