<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
.STYLE4 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>


<%
String kkbbz=(String)session.getAttribute("kkbbz");//�ɿ���
String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}
String khjl=yhmc;
if (!zwbm.equals("03"))
{
	khjl="";
}
String ysy=yhmc;
if (!zwbm.equals("20"))
{
	ysy="";
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
String ywyssxz=cf.fillNull(cf.executeQuery("select sjsbh from sq_yhxx where ygbh='"+ygbh+"'"));
%>

<body bgcolor="#FFFFFF"  >
<noscript><iframe scr="*.htm"></iframe></noscript>


<form method="post" action="" name="selectform">
      <div align="center">��ѯ�ͻ�--��ѯ</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">��ѯ�������</td>
              <td colspan="3"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="crm_zxkhxx.khbh desc">�ͻ����</option>
                  <option value="crm_zxkhxx.lrsj desc">¼��ʱ��</option>
                  <option value="crm_zxkhxx.khxm">�ͻ�����</option>
                  <option value="crm_zxkhxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_zxkhxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_zxkhxx.nlqjbm">��������</option>
                  <option value="crm_zxkhxx.ysrbm">������</option>
                  <option value="crm_zxkhxx.zybm">ְҵ</option>
                  <option value="crm_zxkhxx.sjs">���ʦ</option>
                  <option value="crm_zxkhxx.khjl">�ͻ�����</option>
                  <option value="crm_zxkhxx.jhjfsj">�ƻ�����ʱ��</option>
                  <option value="crm_zxkhxx.yjzxsj">Ԥ��װ��ʱ��</option>
                  <option value="crm_zxkhxx.zxzt">��ѯ״̬</option>
                  <option value="crm_zxkhxx.zxdm">��ѯ����</option>
                  <option value="crm_zxkhxx.sbyybm">ʧ��ԭ��</option>
                  <option value="crm_zxkhxx.ywy">ҵ��Ա</option>
                  <option value="crm_zxkhxx.cqbm">��������</option>
                  <option value="crm_zxkhxx.xqbm">С��</option>
                  <option value="crm_zxkhxx.rddqbm">�ȵ����</option>
                  <option value="crm_zxkhxx.hxwzbm">����λ��</option>
                  <option value="crm_zxkhxx.cxhdbm">�μӴ����</option>
                  <option value="crm_zxkhxx.lfdjbz desc">���������־</option>
                  <option value="crm_zxkhxx.hddjbz desc">������־</option>
                  <option value="crm_zxkhxx.sjfbz desc">��Ʒѱ�־</option>
                  <option value="crm_zxkhxx.xxlysm">��Ϣ��Դ˵��</option>
                  <option value="crm_zxkhxx.jhctsj">�ƻ���ƽ��ͼʱ��</option>
                  <option value="crm_zxkhxx.jhcxgtsj">�ƻ���Ч��ͼʱ��</option>
                  <option value="crm_zxkhxx.jhcsgtsj">�ƻ���ʩ��ͼʱ��</option>
                  <option value="crm_zxkhxx.jhzbjsj">�ƻ������ӱ���ʱ��</option>
                  <option value="crm_zxkhxx.khzyxz">�ͻ���Դ����</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_zxkhxx.khbh desc">�ͻ����</option>
                  <option value="crm_zxkhxx.lrsj desc">¼��ʱ��</option>
                  <option value="crm_zxkhxx.khxm">�ͻ�����</option>
                  <option value="crm_zxkhxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_zxkhxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_zxkhxx.nlqjbm">��������</option>
                  <option value="crm_zxkhxx.ysrbm">������</option>
                  <option value="crm_zxkhxx.zybm">ְҵ</option>
                  <option value="crm_zxkhxx.sjs">���ʦ</option>
                  <option value="crm_zxkhxx.khjl">�ͻ�����</option>
                  <option value="crm_zxkhxx.jhjfsj">�ƻ�����ʱ��</option>
                  <option value="crm_zxkhxx.yjzxsj">Ԥ��װ��ʱ��</option>
                  <option value="crm_zxkhxx.zxzt">��ѯ״̬</option>
                  <option value="crm_zxkhxx.zxdm">��ѯ����</option>
                  <option value="crm_zxkhxx.sbyybm">ʧ��ԭ��</option>
                  <option value="crm_zxkhxx.ywy">ҵ��Ա</option>
                  <option value="crm_zxkhxx.cqbm">��������</option>
                  <option value="crm_zxkhxx.xqbm">С��</option>
                  <option value="crm_zxkhxx.rddqbm">�ȵ����</option>
                  <option value="crm_zxkhxx.hxwzbm">����λ��</option>
                  <option value="crm_zxkhxx.cxhdbm">�μӴ����</option>
                  <option value="crm_zxkhxx.lfdjbz desc">���������־</option>
                  <option value="crm_zxkhxx.hddjbz desc">������־</option>
                  <option value="crm_zxkhxx.sjfbz desc">��Ʒѱ�־</option>
                  <option value="crm_zxkhxx.xxlysm">��Ϣ��Դ˵��</option>
                  <option value="crm_zxkhxx.jhctsj">�ƻ���ƽ��ͼʱ��</option>
                  <option value="crm_zxkhxx.jhcxgtsj">�ƻ���Ч��ͼʱ��</option>
                  <option value="crm_zxkhxx.jhcsgtsj">�ƻ���ʩ��ͼʱ��</option>
                  <option value="crm_zxkhxx.jhzbjsj">�ƻ������ӱ���ʱ��</option>
                  <option value="crm_zxkhxx.khzyxz">�ͻ���Դ����</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_zxkhxx.khbh desc">�ͻ����</option>
                  <option value="crm_zxkhxx.lrsj desc">¼��ʱ��</option>
                  <option value="crm_zxkhxx.khxm">�ͻ�����</option>
                  <option value="crm_zxkhxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_zxkhxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_zxkhxx.nlqjbm">��������</option>
                  <option value="crm_zxkhxx.ysrbm">������</option>
                  <option value="crm_zxkhxx.zybm">ְҵ</option>
                  <option value="crm_zxkhxx.sjs">���ʦ</option>
                  <option value="crm_zxkhxx.khjl">�ͻ�����</option>
                  <option value="crm_zxkhxx.jhjfsj">�ƻ�����ʱ��</option>
                  <option value="crm_zxkhxx.yjzxsj">Ԥ��װ��ʱ��</option>
                  <option value="crm_zxkhxx.zxzt">��ѯ״̬</option>
                  <option value="crm_zxkhxx.zxdm">��ѯ����</option>
                  <option value="crm_zxkhxx.sbyybm">ʧ��ԭ��</option>
                  <option value="crm_zxkhxx.ywy">ҵ��Ա</option>
                  <option value="crm_zxkhxx.cqbm">��������</option>
                  <option value="crm_zxkhxx.xqbm">С��</option>
                  <option value="crm_zxkhxx.rddqbm">�ȵ����</option>
                  <option value="crm_zxkhxx.hxwzbm">����λ��</option>
                  <option value="crm_zxkhxx.cxhdbm">�μӴ����</option>
                  <option value="crm_zxkhxx.lfdjbz desc">���������־</option>
                  <option value="crm_zxkhxx.hddjbz desc">������־</option>
                  <option value="crm_zxkhxx.sjfbz desc">��Ʒѱ�־</option>
                  <option value="crm_zxkhxx.xxlysm">��Ϣ��Դ˵��</option>
                  <option value="crm_zxkhxx.jhctsj">�ƻ���ƽ��ͼʱ��</option>
                  <option value="crm_zxkhxx.jhcxgtsj">�ƻ���Ч��ͼʱ��</option>
                  <option value="crm_zxkhxx.jhcsgtsj">�ƻ���ʩ��ͼʱ��</option>
                  <option value="crm_zxkhxx.jhzbjsj">�ƻ������ӱ���ʱ��</option>
                  <option value="crm_zxkhxx.khzyxz">�ͻ���Դ����</option>
                </select>              </td>
            </tr>
            <%
			if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
			{
				%> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" >��ʾ���</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
            </tr>
            <%
			}
			%> 
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')" name="button">
                <input type="reset"  value="����" name="reset">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">ͳ�Ʊ�</td>
              <td colspan="3"> ��һ�� 
                <input type="hidden" name="tj1name" value="">
                <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
                  <option value=""></option>
                  <option value="nlqjmc">��������</option>
                  <option value="ysrmc">������</option>
                  <option value="zymc">ְҵ</option>
                  <option value="khjl">�ͻ�����</option>
                  <option value="sjs">���ʦ</option>
                  <option value="ywy">ҵ��Ա</option>
                  <option value="DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��')">��ѯ״̬</option>
                  <option value="b.dwmc">��ѯ����</option>
                  <option value="a.dwmc">��ѯ�Ǽǲ���</option>
                  <option value="sbyymc">ʧ��ԭ��</option>
                  <option value="cqmc">��������</option>
                  <option value="xqbm">С��</option>
                  <option value="rddq">�ȵ����</option>
                  <option value="hxwz">����λ��</option>
                  <option value="cxhdbm">�μӴ����</option>
                  <option value="DECODE(crm_zxkhxx.lfdjbz,'N','δ������','Y','�ѽ�����','T','�˶���')">���������־</option>
                  <option value="DECODE(crm_zxkhxx.hddjbz,'N','δ������','Y','�ѽ�����','T','�˶���')">������־</option>
                  <option value="DECODE(crm_zxkhxx.sjfbz,'N','δ����Ʒ�','Y','�ѽ���Ʒ�','T','����Ʒ�')">��Ʒѱ�־</option>
                  <option value="lrr">¼����</option>
                  <option value="xxlysm">��Ϣ��Դ˵��</option>
                </select>
                �ڶ��� 
                <input type="hidden" name="tj2name" value="">
                <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
                  <option value=""></option>
                  <option value="nlqjmc">��������</option>
                  <option value="ysrmc">������</option>
                  <option value="zymc">ְҵ</option>
                  <option value="khjl">�ͻ�����</option>
                  <option value="sjs">���ʦ</option>
                  <option value="ywy">ҵ��Ա</option>
                  <option value="DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��')">��ѯ״̬</option>
                  <option value="b.dwmc">��ѯ����</option>
                  <option value="a.dwmc">��ѯ�Ǽǲ���</option>
                  <option value="sbyymc">ʧ��ԭ��</option>
                  <option value="cqmc">��������</option>
                  <option value="xqbm">С��</option>
                  <option value="rddq">�ȵ����</option>
                  <option value="hxwz">����λ��</option>
                  <option value="cxhdbm">�μӴ����</option>
                  <option value="DECODE(crm_zxkhxx.lfdjbz,'N','δ������','Y','�ѽ�����','T','�˶���')">���������־</option>
                  <option value="DECODE(crm_zxkhxx.hddjbz,'N','δ������','Y','�ѽ�����','T','�˶���')">������־</option>
                  <option value="DECODE(crm_zxkhxx.sjfbz,'N','δ����Ʒ�','Y','�ѽ���Ʒ�','T','����Ʒ�')">��Ʒѱ�־</option>
                  <option value="lrr">¼����</option>
                  <option value="xxlysm">��Ϣ��Դ˵��</option>
                </select>
                ������ 
                <input type="hidden" name="tj3name" value="">
                <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
                  <option value=""></option>
                  <option value="nlqjmc">��������</option>
                  <option value="ysrmc">������</option>
                  <option value="zymc">ְҵ</option>
                  <option value="khjl">�ͻ�����</option>
                  <option value="sjs">���ʦ</option>
                  <option value="ywy">ҵ��Ա</option>
                  <option value="DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��')">��ѯ״̬</option>
                  <option value="b.dwmc">��ѯ����</option>
                  <option value="a.dwmc">��ѯ�Ǽǲ���</option>
                  <option value="sbyymc">ʧ��ԭ��</option>
                  <option value="cqmc">��������</option>
                  <option value="xqbm">С��</option>
                  <option value="rddq">�ȵ����</option>
                  <option value="hxwz">����λ��</option>
                  <option value="cxhdbm">�μӴ����</option>
                  <option value="DECODE(crm_zxkhxx.lfdjbz,'N','δ������','Y','�ѽ�����','T','�˶���')">���������־</option>
                  <option value="DECODE(crm_zxkhxx.hddjbz,'N','δ������','Y','�ѽ�����','T','�˶���')">������־</option>
                  <option value="DECODE(crm_zxkhxx.sjfbz,'N','δ����Ʒ�','Y','�ѽ���Ʒ�','T','����Ʒ�')">��Ʒѱ�־</option>
                  <option value="lrr">¼����</option>
                  <option value="xxlysm">��Ϣ��Դ˵��</option>
                </select>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="�ͻ�ͳ��" onClick="f_do(selectform,'tj')" name="button2">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC"> 
                �ͻ������ֹ�˾              </td>
              <td width="31%">
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
				%> 
				</select>              </td>
              <td width="16%" align="right"> 
                ��ѯ����              </td>
              <td width="34%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="sjsbhMark=0;sjsbh.length=1;">
		  <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
			}
			else if (kfgssq.equals("3"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
			}
			else if (kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}
			%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">���������</td>
              <td width="31%"> 
<%
if ( zwbm.equals("04"))
{
	%>
	<select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <option value=""></option>
	</select>
	<%
}
else if (zwbm.equals("23") )
{
	%>
	  <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"' order by dwbh",ywyssxz);
		%>
	  </select>
	<%
}
else{
	%>
	<select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sjsbh')">
	  <option value=""></option>
	</select>
	<%
}
%>				</td>
              <td width="16%" align="right">���ʦ</td>
              <td width="34%"><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>></td>
            </tr>

		  
	        <tr bgcolor="#FFFFFF">
	          <td align="right" bgcolor="#FFFFCC">ҵ��Ա����С��</td>
	          <td bgcolor="#FFFFCC">
<%
if ( zwbm.equals("19"))
{
	%>
	  <select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
		<option value=""></option>
	  </select>
	<%
}
else if (zwbm.equals("24") )
{
	%>
	  <select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"' order by dwbh",ywyssxz);
		%>
	  </select>
	<%
}
else{
	%>
	  <select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ywyssxz')">
		<option value=""></option>
	  </select>
	<%
}
%>			  </td>
	          <td align="right" bgcolor="#FFFFCC">ҵ��Ա</td>
	          <td bgcolor="#FFFFCC"><input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" <% if (!ywy.equals("")) out.println("readonly");%>></td>
            </tr>
	        <tr bgcolor="#FFFFFF">
	          <td align="right" bgcolor="#FFFFCC">��ѯ״̬</td>
	          <td bgcolor="#FFFFCC"><select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="0">δ�������</option>
                <option value="1">�������</option>
                <option value="2">���ʦ�ύ�ɵ�</option>
                <option value="3">��ǩԼ</option>
                <option value="4">�ɵ�</option>
                <option value="5">�ɵ����δͨ��</option>
              </select></td>
	          <td align="right" bgcolor="#FFFFCC"><font color="#0000FF">�Ƿ���ҵ��Ա</font></td>
	          <td bgcolor="#FFFFCC"><input type="radio" name="sfyywy" value="Y">
��
  <input type="radio" name="sfyywy" value="N">
�� </td>
            </tr>
	        <tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"> 
		�ͻ����              </td>
	  <td width="31%"> 
		<input type="text" name="crm_zxkhxx_khbh" size="20" maxlength="7" >              </td>
	  <td width="16%" align="right">�Ա�</td>
	  <td width="34%"><INPUT type="radio" name="crm_zxkhxx_xb" value="M">��
<INPUT type="radio" name="crm_zxkhxx_xb" value="W">Ů</td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"><span class="STYLE3">�ͻ�����</span></td>
	  <td width="31%"> 
		<input type="text" name="khxm" size="20" maxlength="20" >              </td>
	  <td width="16%" align="right">�ͻ�����</td>
	  <td width="34%"> 
		<input type="text" name="khxm2" size="14" maxlength="20" >
		��ģ����ѯ��</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE3">���ݵ�ַ </span></td>
	  <td><input type="text" name="fwdz" size="20" maxlength="100" ></td>
	  <td align="right">���ݵ�ַ</td>
	  <td><input type="text" name="fwdz2" size="14" maxlength="100" >
	  ��ģ����ѯ��</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE3">��ϵ��ʽ </span></td>
	  <td><input type="text" name="lxfs" size="20" maxlength="50" ></td>
	  <td align="right">��ϵ��ʽ</td>
	  <td> <input type="text" name="lxfs2" size="14" maxlength="50" >
	  ��ģ����ѯ��</td>
	</tr>
	
	<tr bgcolor="#FFFFFF">
	  <td align="right">�ͻ�����</td>
	  <td><input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
	  <td align="right">Ԥ��Ա</td>
	  <td>
		<input name="ysy" type="text" value="<%=ysy%>" size="20" maxlength="20" <% if (!ysy.equals("")) out.println("readonly");%>>	  </td>
	  </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">��Ϣ��Դ</font></td>
	  <td><select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('xxlybm')">
        <option value=""></option>
      </select></td>
	  <td align="right">��Ϣ��Դ˵��</td>
	  <td><input type="text" name="xxlysm" value="" size="20" maxlength="100" ></td>
	  </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><strong>С������</strong></td>
	  <td><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");
%>
      </select></td>
	  <td align="right"><strong>�ͻ���Դ����</strong></td>
	  <td><select name="khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxzbm","");
%>
      </select></td>
	  </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><span class="STYLE4">�����������־</span></td>
	  <td colspan="3"><input type="radio" name="lfdjbz" value="N">
	    δ������
	    <input type="radio" name="lfdjbz" value="Y">
	    �ѽ�����
	    <input type="radio" name="lfdjbz" value="T">
	    �˶��� </td>
	  </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right">����������ʱ�� ��</td>
	  <td><input type="text" name="jlfdjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
	  <td align="right">��</td>
	  <td><input type="text" name="jlfdjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
	  </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE4">��Ʒѱ�־</span></td>
	  <td colspan="3"><input type="radio" name="sjfbz" value="N">
	    δ��
	    <input type="radio" name="sjfbz" value="Y">
	    �ѽ�
	    <input type="radio" name="sjfbz" value="T">
	    ����Ʒ� </td>
	  </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right">����Ʒ�ʱ�� ��</td>
	  <td><input type="text" name="jsjfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
	  <td align="right">��</td>
	  <td><input type="text" name="jsjfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
	  </tr>
		  
		  
		  <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">��Ϣ��˱�־</td>
              <td width="31%">
                <input type="radio" name="shbz" value="Y">
                ����� 
                <input type="radio" name="shbz" value="N">
                δ��� </td>
              <td width="16%" align="right">Ԥ�����</td>
              <td width="34%">
			  <input type="radio" name="ysshbz" value="N">δ���
			  <input type="radio" name="ysshbz" value="Y">���ͨ��
			  <input type="radio" name="ysshbz" value="M">���δͨ��			  </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">�Ƿ������ӱ���</td>
              <td width="31%"> 
                <input type="radio" name="sfzdzbj" value="N">
                δ������ 
                <input type="radio" name="sfzdzbj" value="Y">
                ���� </td>
              <td width="16%" align="right">���ۼ���</td>
              <td width="34%"> 
                <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('bjjb')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">��װ��־</td>
              <td width="31%"> 
                <input type="radio" name="jzbz" value="1">
                ��װ 
                <input type="radio" name="jzbz" value="2">
                ��װ </td>
              <td width="16%" align="right">�Ƿ�ǩ��</td>
              <td width="34%"> 
                <input type="radio" name="sfqd" value="1">
                δǩ�� 
                <input type="radio" name="sfqd" value="2">
                ǩ�� 
                <input type="radio" name="sfqd" value="3">
                ʧ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">ǩ��ƺ�ͬ��־</td>
              <td> 
                <input type="radio" name="qsjhtbz" value="N">
                δǩ 
                <input type="radio" name="qsjhtbz" value="Y">
                ǩ��ͬ</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">ǩ��ƺ�ͬʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="qsjhtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right">��</td>
              <td width="34%"> 
                <input type="text" name="qsjhtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�Ƿ񽻻����</td>
              <td width="31%"> 
                <input type="radio" name="hddjbz" value="N">
                δ�� 
                <input type="radio" name="hddjbz" value="Y">
                �ѽ� 
                <input type="radio" name="hddjbz" value="T">
                �˶��� </td>
              <td width="16%" align="right">�μӴ����</td>
              <td width="34%"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('cxhdbm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�������ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jhddjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right">��</td>
              <td width="34%"> 
                <input type="text" name="jhddjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">������־</td>
              <td width="31%"><%
		cf.radioToken(out, "lfbz","N+δ����&Y+������","");
%></td>
              <td width="16%" align="right">��ƽ��ͼ��־</td>
              <td width="34%"><%
		cf.radioToken(out, "ctbz","N+δ��ͼ&Y+�ѳ�ͼ","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                �������ʱ�� ��              </td>
              <td width="31%"> 
                <input type="text" name="zxdmfpsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right"> 
                ��              </td>
              <td width="34%"> 
                <input type="text" name="zxdmfpsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ���ʦ����ʱ�� ��              </td>
              <td width="31%"> 
                <input type="text" name="sjsfpsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right"> 
                ��              </td>
              <td width="34%"> 
                <input type="text" name="sjsfpsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��������</td>
              <td width="31%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('cqbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right">С��</td>
              <td width="34%"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#E8E8FF">�ȵ����</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('rddqbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right" bgcolor="#E8E8FF">����λ��</td>
              <td width="34%" bgcolor="#E8E8FF"> 
                <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('hxwzbm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#E8E8FF">������</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('ysrbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right" bgcolor="#E8E8FF">&nbsp;</td>
              <td width="34%" bgcolor="#E8E8FF">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">��������</td>
              <td width="31%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('nlqjbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right">ְҵ</td>
              <td width="34%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zybm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ��������              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('fwlxbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right"> 
                װ��Ԥ��              </td>
              <td width="34%"> 
                <select name="crm_zxkhxx_zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zxysbm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ����              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('hxbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right"> 
                ���ڽ������              </td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_fwmj" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ���Ҫ��              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('fgyqbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right"> 
                ʧ��ԭ��              </td>
              <td width="34%"> 
                <select name="crm_zxkhxx_sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('sbyybm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">ʧ��ԭ������</td>
              <td colspan="3"> 
                <input type="text" name="sbyyxs" size="71" maxlength="200" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ϵ�ͻ�</td>
              <td width="31%"> 
                <select name="crm_zxkhxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('khlxbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="16%" align="right">�Ƿ񼯳�ת��װ�ͻ�</td>
              <td width="34%"> 
                <input type="radio" name="sfjczjz" value="1">
                �� 
                <input type="radio" name="sfjczjz" value="2">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                �Ƿ���ط�              </td>
              <td width="31%"><%
	cf.radioToken(out, "crm_zxkhxx_sfxhf","Y+��ط�&N+����ط�","");
%> </td>
              <td width="16%" align="right"> 
                ���»ط�ʱ��              </td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_zxhfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">�ط����� ��</td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_hfrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right">��</td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_hfrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                �ص���־              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm","");
%>
                </select>              </td>
              <td width="16%" align="right"> 
                �ص���              </td>
              <td width="34%"> 
                <input name="hdr" type="text" value="" maxlength="20" size="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">¼�벿��</td>
              <td width="31%"> 
                <select name="crm_zxkhxx_zxdjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('zxdjbm')">
					<option value=""></option>
                </select>              </td>
              <td width="16%" align="right">��Ϣ¼����</td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_lrr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC"> 
                ¼��ʱ�� ��              </td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right"> 
                ��              </td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">ǩ��ʧ��ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_sbsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right">��</td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_sbsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                �ƻ�����ʱ�� ��              </td>
              <td width="31%"> 
                <input type="text" name="jhjfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right"> 
                ��              </td>
              <td width="34%"> 
                <input type="text" name="jhjfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                Ԥ��װ��ʱ�� ��              </td>
              <td width="31%"> 
                <input type="text" name="yjzxsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right"> 
                ��              </td>
              <td width="34%"> 
                <input type="text" name="yjzxsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> �ƻ���ƽ��ͼʱ�� �� </td>
              <td><input type="text" name="jhctsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> �� </td>
              <td><input type="text" name="jhctsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> �ƻ���Ч��ͼʱ�� �� </td>
              <td><input type="text" name="jhcxgtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> �� </td>
              <td><input type="text" name="jhcxgtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> �ƻ���ʩ��ͼʱ�� �� </td>
              <td><input type="text" name="jhcsgtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> �� </td>
              <td><input type="text" name="jhcsgtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> �ƻ������ӱ���ʱ�� �� </td>
              <td><input type="text" name="jhzbjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> �� </td>
              <td><input type="text" name="jhzbjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> ʵ�������ӱ���ʱ�� �� </td>
              <td><input type="text" name="sczbjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> �� </td>
              <td><input type="text" name="sczbjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��Ч��Ϣ��־</td>
              <td><select name="yzxxbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <option value="Y">��Ч��Ϣ</option>
                  <option value="N">��Ч��Ϣ</option>
                </select>              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')" name="button">
                <input type="reset"  value="����" name="reset">
                <input type="button"  value="�ͻ�ͳ��" onClick="f_do(selectform,'tj')" name="button2">              </td>
            </tr>
        </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//����Ajax
	cf.ajax(out);
%>

var sjsbhMark=0;
var ywyssxzMark=0;
var cxhdbmMark=0;
var khlxbmMark=0;

var bjjbMark=0;
var xxlybmMark=0;
var fwlxbmMark=0;
var zxysbmMark=0;
var hxbmMark=0;
var fgyqbmMark=0;
var sbyybmMark=0;
var khlxbmMark=0;
var ysrbmMark=0;
var nlqjbmMark=0;
var zybmMark=0;

var zxdjbmMark=0;
var cqbmMark=0;
var rddqbmMark=0;
var hxwzbmMark=0;


var fieldName="";

function changeFgs(FormName)
{
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	sjsbhMark=0;
	ywyssxzMark=0;
	cxhdbmMark=0;
	zxdjbmMark=0;
	cqbmMark=0;
	rddqbmMark=0;
	hxwzbmMark=0;
	FormName.sjsbh.length=1;
	FormName.ywyssxz.length=1;
	FormName.cxhdbm.length=1;
	FormName.crm_zxkhxx_zxdjbm.length=1;
	FormName.cqbm.length=1;
	FormName.rddqbm.length=1;
	FormName.hxwzbm.length=1;

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getThis(lx)
{
	var sql;

	fieldName=lx;

	if (selectform.ssfgs.value=="")
	{
		selectform.ssfgs.focus();
		alert("������ѡ�񡾷ֹ�˾��");
		return;
	}

	if (lx=="sjsbh")
	{
		if (sjsbhMark==0)
		{
			if (selectform.zxdm.value=="")
			{
				sjsbhMark=0;
				selectform.zxdm.focus();
				alert("������ѡ����ѯ���桿");
				return;
			}

			var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+selectform.zxdm.value+"' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sjsbhMark=1;
		}
		else{
			sjsbhMark=2;
		}
	}
	else if (lx=="ywyssxz")
	{
		if (ywyssxzMark==0)
		{
			var sql="select dwbh,dwmc from sq_dwxx where dwlx='F4' and  cxbz='N' and ssfgs='"+selectform.ssfgs.value+"' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			ywyssxzMark=1;
		}
		else{
			ywyssxzMark=2;
		}
	}
	else if (lx=="cxhdbm")
	{
		if (cxhdbmMark==0)
		{
			sql="select cxhdmc c1,cxhdmc||DECODE(jsbz,'N','','Y','��������') c2 from jc_cxhd where fgsbh='"+selectform.ssfgs.value+"' order by jsbz,cxhdbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			cxhdbmMark=1;
		}
		else{
			cxhdbmMark=2;
		}
	}
	else if (lx=="zxdjbm")
	{
		if (zxdjbmMark==0)
		{
			sql="select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssfgs='"+selectform.ssfgs.value+"' order by cxbz,dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zxdjbmMark=1;
		}
		else{
			zxdjbmMark=2;
		}
	}
	else if (lx=="cqbm")
	{
		if (cqbmMark==0)
		{
			sql="select cqbm,cqmc from dm_cqbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.ssfgs.value+"') order by cqbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
//			window.open(actionStr);

			openAjax(actionStr);
			cqbmMark=1;
		}
		else{
			cqbmMark=2;
		}
	}
	else if (lx=="rddqbm")
	{
		if (rddqbmMark==0)
		{
			sql="select rddqbm,rddq from dm_rddqbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.ssfgs.value+"') order by rddqbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			rddqbmMark=1;
		}
		else{
			rddqbmMark=2;
		}
	}
	else if (lx=="hxwzbm")
	{
		if (hxwzbmMark==0)
		{
			sql="select hxwzbm,hxwz from dm_hxwzbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.ssfgs.value+"') order by hxwzbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			hxwzbmMark=1;
		}
		else{
			hxwzbmMark=2;
		}
	}
}

function getThisOne(lx)
{
	var sql;

	fieldName=lx;

	if (lx=="khlxbm")
	{
		if (khlxbmMark==0)
		{
			var sql="select khlxbm,khlxmc from dm_khlxbm order by khlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			khlxbmMark=1;
		}
	}
	else if (lx=="bjjb")
	{
		if (bjjbMark==0)
		{
			var sql="select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			bjjbMark=1;
		}
	}
	else if (lx=="xxlybm")
	{
		if (xxlybmMark==0)
		{
			var sql="select xxlybm,xxlymc from dm_xxlybm order by xxlybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			xxlybmMark=1;
		}
	}
	else if (lx=="fwlxbm")
	{
		if (fwlxbmMark==0)
		{
			var sql="select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			fwlxbmMark=1;
		}
	}
	else if (lx=="zxysbm")
	{
		if (zxysbmMark==0)
		{
			var sql="select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			zxysbmMark=1;
		}
	}
	else if (lx=="hxbm")
	{
		if (hxbmMark==0)
		{
			var sql="select hxbm,hxmc from dm_hxbm order by hxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			hxbmMark=1;
		}
	}
	else if (lx=="fgyqbm")
	{
		if (fgyqbmMark==0)
		{
			var sql="select fgflbm,fgflmc from dm_fgflbm order by fgflbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			fgyqbmMark=1;
		}
	}
	else if (lx=="sbyybm")
	{
		if (sbyybmMark==0)
		{
			var sql="select sbyybm,sbyymc from dm_sbyybm order by sbyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sbyybmMark=1;
		}
	}
	else if (lx=="khlxbm")
	{
		if (khlxbmMark==0)
		{
			var sql="select khlxbm,khlxmc from dm_khlxbm order by khlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			khlxbmMark=1;
		}
	}
	else if (lx=="ysrbm")
	{
		if (ysrbmMark==0)
		{
			sql="select ysrbm,ysrmc from dm_ysrbm order by ysrbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			ysrbmMark=1;
		}
		else{
			ysrbmMark=2;
		}
	}
	else if (lx=="nlqjbm")
	{
		if (nlqjbmMark==0)
		{
			sql="select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			nlqjbmMark=1;
		}
		else{
			nlqjbmMark=2;
		}
	}
	else if (lx=="zybm")
	{
		if (zybmMark==0)
		{
			sql="select zybm,zymc from dm_zybm order by zybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zybmMark=1;
		}
		else{
			zybmMark=2;
		}
	}
}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.zxdm,ajaxRetStr);
	}
	else if (fieldName=="sjsbh")
	{
		strToSelect(selectform.sjsbh,ajaxRetStr);
	}
	else if (fieldName=="ywyssxz")
	{
		strToSelect(selectform.ywyssxz,ajaxRetStr);
	}
	else if (fieldName=="cxhdbm")
	{
		strToSelect(selectform.cxhdbm,ajaxRetStr);
	}
	else if (fieldName=="khlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_khlxbm,ajaxRetStr);
	}
	else if (fieldName=="bjjb")
	{
		strToSelect(selectform.bjjb,ajaxRetStr);
	}
	else if (fieldName=="xxlybm")
	{
		strToSelect(selectform.xxlybm,ajaxRetStr);
	}
	else if (fieldName=="fwlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_fwlxbm,ajaxRetStr);
	}
	else if (fieldName=="zxysbm")
	{
		strToSelect(selectform.crm_zxkhxx_zxysbm,ajaxRetStr);
	}
	else if (fieldName=="hxbm")
	{
		strToSelect(selectform.crm_zxkhxx_hxbm,ajaxRetStr);
	}
	else if (fieldName=="fgyqbm")
	{
		strToSelect(selectform.crm_zxkhxx_fgyqbm,ajaxRetStr);
	}
	else if (fieldName=="sbyybm")
	{
		strToSelect(selectform.crm_zxkhxx_sbyybm,ajaxRetStr);
	}
	else if (fieldName=="khlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_khlxbm,ajaxRetStr);
	}
	else if (fieldName=="ysrbm")
	{
		strToSelect(selectform.ysrbm,ajaxRetStr);
	}
	else if (fieldName=="nlqjbm")
	{
		strToSelect(selectform.nlqjbm,ajaxRetStr);
	}
	else if (fieldName=="zybm")
	{
		strToSelect(selectform.zybm,ajaxRetStr);
	}
	else if (fieldName=="zxdjbm")
	{
		strToSelect(selectform.crm_zxkhxx_zxdjbm,ajaxRetStr);
	}
	else if (fieldName=="cqbm")
	{
		strToSelect(selectform.cqbm,ajaxRetStr);
	}
	else if (fieldName=="rddqbm")
	{
		strToSelect(selectform.rddqbm,ajaxRetStr);
	}
	else if (fieldName=="hxwzbm")
	{
		strToSelect(selectform.hxwzbm,ajaxRetStr);
	}
}


function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isNumber(FormName.crm_zxkhxx_fwmj, "���ڽ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.qsjhtsj, "ǩ��ƺ�ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.qsjhtsj2, "ǩ��ƺ�ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jlfdjsj, "����������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jlfdjsj2, "����������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhddjsj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhddjsj2, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jsjfsj, "����Ʒ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jsjfsj2, "����Ʒ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_zxhfsj, "���»ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq, "�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq2, "�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_sbsj, "ǩ��ʧ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_sbsj2, "ǩ��ʧ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zxdmfpsj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zxdmfpsj2, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsfpsj, "���ʦ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsfpsj2, "���ʦ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjfsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjfsj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "Ԥ��װ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj2, "Ԥ��װ��ʱ��"))) {
		return false;
	}

	if(!(isDatetime(FormName.jhctsj, "�ƻ���ƽ��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhctsj2, "�ƻ���ƽ��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcxgtsj, "�ƻ���Ч��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcxgtsj2, "�ƻ���Ч��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcsgtsj, "�ƻ���ʩ��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcsgtsj2, "�ƻ���ʩ��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhzbjsj, "�ƻ������ӱ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhzbjsj2, "�ƻ������ӱ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sczbjsj, "ʵ�������ӱ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sczbjsj2, "ʵ�������ӱ���ʱ��"))) {
		return false;
	}


	if (lx=='cx')
	{
		FormName.action="Crm_zxkhxxCxList.jsp";
	}
	else if (lx=='tj')
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
			alert("��ѡ��[ͳ����]��");
			FormName.tj1.focus();
			return false;
		}
		FormName.action="Crm_zxkhxxTjList.jsp";
	}
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
