<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>



<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String kkbbz=(String)session.getAttribute("kkbbz");//�ɿ���
String yhjs=(String)session.getAttribute("yhjs");
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
String khxxglsj=cf.executeQuery("select khxxglsj from sq_dwxx where dwlx='A0'");
if (khxxglsj==null)
{
	khxxglsj="";
}
else{
	khxxglsj=khxxglsj.substring(0,10);
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�������ģ��������ͻ�����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxJyList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCFFFF"> 
              <td align="right">�������</td>
              <td colspan="3" bgcolor="#CCFFFF"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="crm_khxx.lrsj desc">¼��ʱ��</option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.khjl">�ͻ�����</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.ysy">Ԥ��Ա</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="sq_sgd.sgdlx">ʩ��������</option>
                  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.gcjdbm">���̽���</option>
                  <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                  <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                  <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                  <option value="crm_khxx.dwbh">ǩԼ����</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','δ����','2','����')">�����Ƿ�����</option>
                  <option value="crm_khxx.yqts">������������</option>
                  <option value="crm_khxx.cxhdbm">�μӴ����</option>
                  <option value="crm_khxx.jzbz">��װ��־</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.khjl">�ͻ�����</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.ysy">Ԥ��Ա</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="sq_sgd.sgdlx">ʩ��������</option>
                  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.gcjdbm">���̽���</option>
                  <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                  <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                  <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                  <option value="crm_khxx.dwbh">ǩԼ����</option>
                  <option value="crm_khxx.lrsj">¼��ʱ��</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','δ����','2','����')">�����Ƿ�����</option>
                  <option value="crm_khxx.yqts">������������</option>
                  <option value="crm_khxx.cxhdbm">�μӴ����</option>
                  <option value="crm_khxx.jzbz">��װ��־</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.khjl">�ͻ�����</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.ysy">Ԥ��Ա</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="sq_sgd.sgdlx">ʩ��������</option>
                  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.gcjdbm">���̽���</option>
                  <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                  <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                  <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                  <option value="crm_khxx.dwbh">ǩԼ����</option>
                  <option value="crm_khxx.lrsj">¼��ʱ��</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','δ����','2','����')">�����Ƿ�����</option>
                  <option value="crm_khxx.yqts">������������</option>
                  <option value="crm_khxx.cxhdbm">�μӴ����</option>
                  <option value="crm_khxx.jzbz">��װ��־</option>
                </select>              </td>
            </tr>
            <%
			if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
			{
				%> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" >��ʾ���</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
                <input type="text" name="myxssl" size="7" maxlength="13" value="25">              </td>
            </tr>
            <%
			}
			%> 
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'gccx')" name="button">
                <input type="reset"  value="����" name="reset">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%"> 
                <div align="right">�ֹ�˾</div>              </td>
              <td width="30%">
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
				</select>			  </td> 
              <td width="20%"> 
                <div align="right">ǩԼ����</div>              </td>
              <td width="30%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="sjsbhMark=0;sjsbh.length=1;">
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
                </select>			  </td> 
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right">����С��</td>
              <td> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sjsbh')">
                  <option value=""></option>
                </select>              </td>
              <td align="right">��װ��־</td>
              <td> 
                <input type="radio" name="jzbz" value="1">
                ��װ 
                <input type="radio" name="jzbz" value="2">
                ��װ </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td> 
                <div align="right">�ͻ����</div>              </td>
              <td> 
                <input type="text" name="crm_khxx_khbh" size="20" maxlength="7" >              </td>
              <td align="right">��װβ��ȫ��</td>
              <td>
				  <input type="radio" name="jzwkqs" value="Y">ȫ��
				  <input type="radio" name="jzwkqs" value="N">��			  </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td bgcolor="#E8E8FF" align="right">��ͬ��</td>
              <td><input type="text" name="crm_khxx_hth" size="20" maxlength="20" ></td>
              <td align="right">�����ͬ���</td>
              <td><input type="text" name="smhtbh" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td bgcolor="#E8E8FF" align="right"><font color="#0000CC"><b>�ͻ�����</b></font></td>
              <td> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >              </td>
              <td align="right">�ͻ�����</td>
              <td> 
                <input type="text" name="crm_khxx_khxm2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td bgcolor="#E8E8FF" align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font></td>
              <td> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="20" >              </td>
              <td align="right">��ϵ��ʽ</td>
              <td> 
                <input type="text" name="crm_khxx_lxfs2" size="14" maxlength="20" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td bgcolor="#E8E8FF" align="right"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
              <td> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >              </td>
              <td align="right">���ݵ�ַ</td>
              <td> 
                <input type="text" name="crm_khxx_fwdz2" size="14" maxlength="100" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"> 
                ���ʦ              </td>
              <td bgcolor="#FFFFFF"> 
                <input type="text" name="crm_khxx_sjs" value="<%=sjs%>" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>>              </td>
              <td align="right"> 
                ҵ��Ա              </td>
              <td> 
                <input type="text" name="ywy"  value="<%=ywy%>" size="20" maxlength="20" <% if (!ywy.equals("")) out.println("readonly");%>>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ͻ�����</td>
              <td><input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
              <td align="right">Ԥ��Ա</td>
              <td><input name="ysy" type="text" value="<%=ysy%>" size="20" maxlength="20" <% if (!ysy.equals("")) out.println("readonly");%>></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"> 
                ʩ�����Ƿ���ְ              </td>
              <td> 
                <input type="radio" name="cxbz" value="N">
                ��ְ 
                <input type="radio" name="cxbz" value="Y">
                ��ְ </td>
              <td align="right"> 
                ʩ��������              </td>
              <td> 
                <input type="radio" name="sgdlx" value="S0">
                ��ֱ���� 
                <input type="radio" name="sgdlx" value="S1">
                ֱ���� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">��ְʩ����</td>
              <td> 
                <select name="zzsgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('zzsgd')">
                  <option value=""></option>
                </select>              </td>
              <td align="right">��ְʩ����</td>
              <td> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right">ʩ������</td>
              <td> 
                <input type="text" name="crm_khxx_sgbz" size="20" maxlength="20" >              </td>
              <td align="right">�ʼ�����</td>
              <td> 
                <select name="crm_khxx_zjxm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('zjxm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right">���̽���</td>
              <td> 
                <select name="crm_khxx_gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%> 
                </select>              </td>
              <td align="right">���֤����</td>
              <td> 
                <input type="text" name="sfzhm" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#FFFFCC"><font color="#0000CC"><b>ǩԼ����</b></font> 
                ��</td>
              <td> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">              </td>
              <td align="right">��</td>
              <td> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td> 
                <div align="right">¼��ʱ�� ��</div>              </td>
              <td> 
                <input type="text" name="crm_khxx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td> 
                <div align="right">��</div>              </td>
              <td> 
                <input type="text" name="crm_khxx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#FFFFCC"><b><font color="#0000CC">�ɵ�ʱ��</font></b> 
                ��</td>
              <td> 
                <input type="text" name="crm_khxx_pdsj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">              </td>
              <td align="right">��</td>
              <td> 
                <input type="text" name="crm_khxx_pdsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td align="right">��ϵ�ͻ�</td>
              <td> 
                <select name="crm_khxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('khlxbm')">
                  <option value=""></option>
                </select>              </td>
              <td align="right">�ص���־</td>
              <td> 
                <select name="crm_khxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">�ǻص�</option>
                  <option value="2">���ʦ�ص�</option>
                  <option value="3">ʩ���ӻص�</option>
                  <option value="4">�Ͽͻ��ص�</option>
                  <option value="5">Ա���ص�</option>
                  <option value="6">�೤�ص�</option>
                  <option value="7">��¥��</option>
                  <option value="8">������</option>
                  <option value="9">����</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td bgcolor="#E8E8FF" align="right">�ɵ�״̬</td>
              <td> 
                <select name="crm_khxx_pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">δ�ɵ�</option>
                  <option value="2">�ɵ�</option>
                </select>              </td>
              <td align="right">������֤��־</td>
              <td> 
                <select name="kgzbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">δ������֤</option>
                  <option value="Y">�ѳ�����֤</option>
                </select>              </td>
            </tr>
          </table>

          <table width="100%" border="0" style="FONT-SIZE:12;display:block" id="id1" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">��������</td>
              <td bgcolor="#E8E8FF" width="30%"> 
                <select name="crm_khxx_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('cqbm')">
                  <option value=""></option>
                </select>
              </td>
              <td align="right" bgcolor="#E8E8FF" width="20%">С��/�ֵ�</td>
              <td bgcolor="#E8E8FF" width="30%"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">�����ȵ����</td>
              <td bgcolor="#E8E8FF" width="30%"> 
                <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('rddqbm')">
                  <option value=""></option>
                </select>
              </td>
              <td align="right" bgcolor="#E8E8FF" width="20%">��������λ��</td>
              <td bgcolor="#E8E8FF" width="30%"> 
                <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('hxwzbm')">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">������</td>
              <td bgcolor="#E8E8FF" width="30%"> 
                <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('ysrbm')">
                  <option value=""></option>
                </select>
              </td>
              <td align="right" bgcolor="#E8E8FF" width="20%">&nbsp;</td>
              <td bgcolor="#E8E8FF" width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">��������</td>
              <td width="30%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('nlqjbm')">
                  <option value=""></option>
                </select>
              </td>
              <td align="right" width="20%">ְҵ</td>
              <td width="30%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zybm')">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="20%">������� ��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fwmj" size="20" maxlength="8" >
              </td>
              <td align="right" width="20%">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fwmj2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">����ǩԼ�� ��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
              </td>
              <td align="right" width="20%">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td bgcolor="#FFFFCC" width="20%"> 
                <div align="right">��ͬ�������� ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="20%"> 
                <div align="right">��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">ʵ�ʿ������� ��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjkgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjkgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">��ͬ�������� ��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFFF" width="20%">ʵ�ʿ������� ��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjjgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjjgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="20%">ʵ������� ��</td>
              <td width="30%"> 
                <input type="text" name="sjwjrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">��</td>
              <td width="30%"> 
                <input type="text" name="sjwjrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="20%">�깤��־</td>
              <td width="30%"> 
                <select name="crm_khxx_wgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">δ����</option>
                  <option value="2">�ѿ���</option>
                  <option value="3">���깤</option>
                </select>
              </td>
              <td align="right" width="20%">����־</td>
              <td width="30%"> 
                <select name="crm_khxx_wjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">δ���</option>
                  <option value="2">�����</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="20%">���ι������ս���</td>
              <td width="30%"> 
                <select name="ybysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('ybysxmbm')">
                  <option value=""></option>
                </select>
              </td>
              <td align="right" width="20%">�������ս���</td>
              <td width="30%"> 
                <select name="zqysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zqysxmbm')">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">ͣ����־</td>
              <td width="30%"> 
                <select name="tgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="W">����</option>
                  <option value="Y">��ͣ��</option>
                  <option value="N">ͣ���Ѹ���</option>
                </select>
              </td>
              <td align="right" width="20%">�ͻ�����</td>
              <td width="30%"> 
                <select name="crm_khxx_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="2">��װ�ͻ�</option>
                  <option value="3">�˵��ͻ�</option>
                  <option value="4">�Ǽ�װ�ͻ�</option>
                  <option value="5">��ƿͻ�</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">Ͷ�߱�־</td>
              <td width="30%"> 
                <input type="radio" name="tsbz" value="Y">
                ��Ͷ�� 
                <input type="radio" name="tsbz" value="N">
                ��Ͷ�� </td>
              <td align="right" width="20%">���ޱ�־</td>
              <td width="30%"> 
                <input type="radio" name="bxbz" value="Y">
                �б��� 
                <input type="radio" name="bxbz" value="N">
                �ޱ��� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">�����Ƿ�����</td>
              <td width="30%"> 
                <input type="radio" name="gcsfyq" value="1">
                δ���� 
                <input type="radio" name="gcsfyq" value="2">
                ���� </td>
              <td align="right" width="20%">��������ԭ��</td>
              <td width="30%"> 
                <select name="gcyqyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('gcyqyybm')">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFFF" width="20%">���������� ��</td>
              <td width="30%"> 
                <input type="text" name="yqts" value="" size="20" maxlength="10" >
              </td>
              <td align="right" width="20%">��</td>
              <td width="30%"> 
                <input type="text" name="yqts2" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">ĳ��ԭ���������� ��</td>
              <td width="30%"> 
                <input type="text" name="yyyqts" value="" size="20" maxlength="10" >
              </td>
              <td align="right" width="20%">��</td>
              <td width="30%"> 
                <input type="text" name="yyyqts2" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="20%">ˮ�ʷ������Ƿ񷢷�</td>
              <td width="30%"> 
                <input type="radio" name="sffk" value="Y">
                ���� 
                <input type="radio" name="sffk" value="N">
                δ���� </td>
              <td align="right" width="20%">�Ǽǿ���</td>
              <td width="30%"> 
                <input type="text" name="djkh" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="20%">�������� ��</td>
              <td width="30%"> 
                <input type="text" name="fkrq" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">��</td>
              <td width="30%"> 
                <input type="text" name="fkrq2" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">�Ƿ�ȯ</td>
              <td width="30%"> 
                <input type="radio" name="sffj"  value="Y">
                �� 
                <input type="radio" name="sffj"  value="N" >
                �� </td>
              <td align="right" width="20%">&nbsp;</td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">�Ƿ�����֤</td>
              <td width="30%"> 
                <input type="radio" name="sfyrz"  value="Y">
                �� 
                <input type="radio" name="sfyrz"  value="N" >
                �� </td>
              <td align="right" width="20%">��֤�г�</td>
              <td width="30%"> 
                <select name="rzsc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('rzsc')">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">�Ƿ����ϱ���</td>
              <td width="30%"> 
                <input type="radio" name="sfysbx" value="1">
                δ�ϱ��� 
                <input type="radio" name="sfysbx" value="2">
                �ѱ��� </td>
              <td align="right" width="20%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">���޿�ʼʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="bxkssj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">��</td>
              <td width="30%"> 
                <input type="text" name="bxkssj2" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">���޽�ֹʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="bxjzsj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">��</td>
              <td width="30%"> 
                <input type="text" name="bxjzsj2" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">������Ʒ����</td>
              <td width="30%"> 
                <select name="jcjjcp" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="zclbMark=0;sq_gysxx_zclb.length=1;gysmcMark=0;gysmc.length=1;jcddztMark=0;jcddzt.length=1;">
                  <option value=""></option>
                  <option value="1">ľ��</option>
                  <option value="2">����</option>
                  <option value="3">�Ҿ�</option>
                  <option value="4">����</option>
                  <option value="5">ȫ��</option>
                </select>
              </td>
              <td bgcolor="#E8E8FF" align="right" width="20%">�������</td>
              <td width="30%"> 
                <select name="sq_gysxx_zclb" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zclb')" onChange="gysmcMark=0;gysmc.length=1;">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">����/Ʒ��</td>
              <td width="30%"> 
                <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gysmc')">
                  <option value=""></option>
                </select>
              </td>
              <td bgcolor="#E8E8FF" align="right" width="20%">����/Ʒ��</td>
              <td width="30%"> 
                <input type="text" name="gysmc2" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">���ɶ���/��ͬ���� ��</td>
              <td width="30%"> 
                <input type="text" name="ddrq" size="20" maxlength="10" value=""  onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">��</td>
              <td width="30%"> 
                <input type="text" name="ddrq2" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">����״̬</td>
              <td width="30%"> 
                <select name="jcddzt" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('jcddzt')">
                </select>
              </td>
              <td bgcolor="#E8E8FF" align="right" width="20%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">��ĿרԱ</td>
              <td width="30%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xmzy')">
                  <option value=""></option>
                </select>
              </td>
              <td bgcolor="#E8E8FF" align="right" width="20%">�Ҿ����ʦ</td>
              <td width="30%"> 
                <input type="text" name="jjsjs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">��ĿרԱ�Ƿ�����ϵ</td>
              <td width="30%"> 
                <select name="sfylx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">δ��ϵ</option>
                  <option value="Y">����ϵ</option>
                </select>
              </td>
              <td bgcolor="#E8E8FF" align="right" width="20%">�ͻ�������ϵ��ʽ</td>
              <td width="30%"> 
                <select name="jslxfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">�绰��ϵ</option>
                  <option value="2">������</option>
                  <option value="3">��������</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">�μӴ����</td>
              <td colspan="3"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:512PX" onclick="getThis('cxhdbm')">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khxxglsj" value="<%=khxxglsj%>" >
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'gccx')" >
              <input type="reset"  value="����" name="reset"></td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
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
var zjxmMark=0;
var rzscMark=0;
var cqbmMark=0;
var rddqbmMark=0;
var hxwzbmMark=0;
var ysrbmMark=0;
var nlqjbmMark=0;
var zybmMark=0;
var xmzyMark=0;

var cxhdbmMark=0;
var zzsgdMark=0;
var sgdMark=0;
var zjxmMark=0;
var khlxbmMark=0;
var ybysxmbmMark=0;
var zqysxmbmMark=0;
var gcyqyybmMark=0;

var zclbMark=0;
var gysmcMark=0;
var jcddztMark=0;

var fieldName="";


function changeFgs(FormName) 
{
	FormName.crm_khxx_dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	sjsbhMark=0;
	zjxmMark=0;
	rzscMark=0;
	cqbmMark=0;
	rddqbmMark=0;
	hxwzbmMark=0;
	xmzyMark=0;

	cxhdbmMark=0;
	zzsgdMark=0;
	sgdMark=0;
	zjxmMark=0;

	gysmcMark=0;

	FormName.sjsbh.length=1;
	FormName.xmzy.length=1;
	FormName.rzsc.length=1;
	FormName.crm_khxx_cqbm.length=1;
	FormName.rddqbm.length=1;
	FormName.hxwzbm.length=1;

	FormName.cxhdbm.length=1;
	FormName.zzsgd.length=1;
	FormName.crm_khxx_sgd.length=1;
	FormName.crm_khxx_zjxm.length=1;


	FormName.gysmc.length=1;


	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}


function getThis(lx)
{
	var sql;

	fieldName=lx;

	if (selectform.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("������ѡ�񡾷ֹ�˾��");
		return;
	}

	if (lx=="sjsbh")
	{
		if (sjsbhMark==0)
		{
			if (selectform.crm_khxx_dwbh.value=="")
			{
				sjsbhMark=0;
				selectform.crm_khxx_dwbh.focus();
				alert("������ѡ��ǩԼ���桿");
				return;
			}

			var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+selectform.crm_khxx_dwbh.value+"' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sjsbhMark=1;
		}
		else{
			sjsbhMark=2;
		}
	}
	else if (lx=="xmzy")
	{
		if (xmzyMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N') ";
			sql+=" order by yhmc";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			xmzyMark=1;
		}
		else{
			xmzyMark=2;
		}
	}
	else if (lx=="rzsc")
	{
		if (rzscMark==0)
		{
			sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssfgs='"+selectform.fgs.value+"' and cxbz='N' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			rzscMark=1;
		}
		else{
			rzscMark=2;
		}
	}
	else if (lx=="cqbm")
	{
		if (cqbmMark==0)
		{
			sql="select cqbm,cqmc from dm_cqbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.fgs.value+"') order by cqbm";
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
			sql="select rddqbm,rddq from dm_rddqbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.fgs.value+"') order by rddqbm";
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
			sql="select hxwzbm,hxwz from dm_hxwzbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.fgs.value+"') order by hxwzbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			hxwzbmMark=1;
		}
		else{
			hxwzbmMark=2;
		}
	}

	else if (lx=="cxhdbm")
	{
		if (cxhdbmMark==0)
		{
			sql="select cxhdmc c1,cxhdmc||DECODE(jsbz,'N','','Y','��������') c2 from jc_cxhd where fgsbh='"+selectform.fgs.value+"' order by jsbz,cxhdbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			cxhdbmMark=1;
		}
		else{
			cxhdbmMark=2;
		}
	}
	else if (lx=="zzsgd")
	{
		if (zzsgdMark==0)
		{
			sql="select sgd,sgdmc||'��'||DECODE(sq_sgd.sgdlx,'S0','��ֱ��','S1','ֱ��')||'��' from sq_sgd where ssfgs='"+selectform.fgs.value+"' and cxbz='N' order by sgdlx desc,sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zzsgdMark=1;
		}
		else{
			zzsgdMark=2;
		}
	}
	else if (lx=="sgd")
	{
		if (sgdMark==0)
		{
			sql="select sgd,sgdmc||'��'||DECODE(sq_sgd.sgdlx,'S0','��ֱ��','S1','ֱ��')||'��' from sq_sgd where ssfgs='"+selectform.fgs.value+"' and cxbz='Y' order by sgdlx desc,sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			sgdMark=1;
		}
		else{
			sgdMark=2;
		}
	}
	else if (lx=="zjxm")
	{
		if (zjxmMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='05' and sq_yhxx.sfzszg in('Y','N') ";
			sql+=" order by yhmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zjxmMark=1;
		}
		else{
			zjxmMark=2;
		}
	}
	else if (lx=="gysmc")
	{
		if (gysmcMark==0)
		{
			if (selectform.jcjjcp.value=="")
			{
				gysmcMark=0;
				selectform.jcjjcp.focus();
				alert("������ѡ�񡾶�����Ʒ���͡�");
				return;
			}

			if (selectform.jcjjcp.value=="4")
			{
				if (selectform.sq_gysxx_zclb.value=="")
				{
					gysmcMark=0;
					selectform.sq_gysxx_zclb.focus();
					alert("��ѡ���������");
					return;
				}

				sql="select sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.dqbm=sq_ppgyssqfgs.dqbm and sq_gysxx.gysmc=sq_ppgyssqfgs.gysmc and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='"+selectform.jcjjcp.value+"' and sq_gysxx.zclb='"+selectform.sq_gysxx_zclb.value+"' order by sq_gysxx.gysmc";
			}
			else{
				sql="select sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.dqbm=sq_ppgyssqfgs.dqbm and sq_gysxx.gysmc=sq_ppgyssqfgs.gysmc and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='"+selectform.jcjjcp.value+"' order by sq_gysxx.gysmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;
//			window.open(actionStr);

			openAjax(actionStr);
			gysmcMark=1;
		}
		else{
			gysmcMark=2;
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
//			window.open(actionStr);

			openAjax(actionStr);
			zybmMark=1;
		}
		else{
			zybmMark=2;
		}
	}
	else if (lx=="ybysxmbm")
	{
		if (ybysxmbmMark==0)
		{
			sql="select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='3' order by gcjdbm,gcyszxmbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			ybysxmbmMark=1;
		}
		else{
			ybysxmbmMark=2;
		}
	}
	else if (lx=="zqysxmbm")
	{
		if (zqysxmbmMark==0)
		{
			sql="select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='4' order by gcjdbm,gcyszxmbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zqysxmbmMark=1;
		}
		else{
			zqysxmbmMark=2;
		}
	}
	else if (lx=="gcyqyybm")
	{
		if (gcyqyybmMark==0)
		{
			sql="select gcyqyybm,gcyqyymc from dm_gcyqyybm order by gcyqyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			gcyqyybmMark=1;
		}
		else{
			gcyqyybmMark=2;
		}
	}
	else if (lx=="zclb")
	{
		if (zclbMark==0)
		{
			if (selectform.jcjjcp.value!="4")
			{
				zclbMark=0;
				selectform.jcjjcp.focus();
				alert("��ѡ�񡾶�����Ʒ���͡�Ϊ����");
				return;
			}

			sql="select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm order by zcxlmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zclbMark=1;
		}
		else{
			zclbMark=2;
		}
	}
	else if (lx=="jcddzt")
	{
		if (jcddztMark==0)
		{
			if (selectform.jcjjcp.value=="")
			{
				jcddztMark=0;
				selectform.jcjjcp.focus();
				alert("������ѡ�񡾶�����Ʒ���͡�");
				return;
			}

			if (selectform.jcjjcp.value=="1")
			{
				sql="select clzt,clztmc from jdm_mmyddzt order by clzt";
			}
			else if (selectform.jcjjcp.value=="2")
			{
				sql="select clzt,clztmc from jdm_cgddzt order by clzt";
			}
			else if (selectform.jcjjcp.value=="3")
			{
				sql="select clzt,clztmc from jdm_jjddzt order by clzt";
			}
			else if (selectform.jcjjcp.value=="4")
			{
				sql="select clzt,clztmc from jdm_zcddzt order by clzt";
			}

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			jcddztMark=1;
		}
		else{
			jcddztMark=2;
		}
	}
}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.crm_khxx_dwbh,ajaxRetStr);
	}
	else if (fieldName=="sjsbh")
	{
		strToSelect(selectform.sjsbh,ajaxRetStr);
	}
	else if (fieldName=="xmzy")
	{
		strToSelect(selectform.xmzy,ajaxRetStr);
	}
	else if (fieldName=="rzsc")
	{
		strToSelect(selectform.rzsc,ajaxRetStr);
	}
	else if (fieldName=="cqbm")
	{
		strToSelect(selectform.crm_khxx_cqbm,ajaxRetStr);
	}
	else if (fieldName=="rddqbm")
	{
		strToSelect(selectform.rddqbm,ajaxRetStr);
	}
	else if (fieldName=="hxwzbm")
	{
		strToSelect(selectform.hxwzbm,ajaxRetStr);
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


	else if (fieldName=="cxhdbm")
	{
		strToSelect(selectform.cxhdbm,ajaxRetStr);
	}
	else if (fieldName=="zzsgd")
	{
		strToSelect(selectform.zzsgd,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToSelect(selectform.crm_khxx_sgd,ajaxRetStr);
	}
	else if (fieldName=="zjxm")
	{
		strToSelect(selectform.crm_khxx_zjxm,ajaxRetStr);
	}
	else if (fieldName=="khlxbm")
	{
		strToSelect(selectform.crm_khxx_khlxbm,ajaxRetStr);
	}
	else if (fieldName=="ybysxmbm")
	{
		strToSelect(selectform.ybysxmbm,ajaxRetStr);
	}
	else if (fieldName=="zqysxmbm")
	{
		strToSelect(selectform.zqysxmbm,ajaxRetStr);
	}
	else if (fieldName=="gcyqyybm")
	{
		strToSelect(selectform.gcyqyybm,ajaxRetStr);
	}
	else if (fieldName=="zclb")
	{
		strToSelect(selectform.sq_gysxx_zclb,ajaxRetStr);
	}
	else if (fieldName=="gysmc")
	{
		strToItem2(selectform.gysmc,ajaxRetStr);
	}
	else if (fieldName=="jcddzt")
	{
		strToSelect(selectform.jcddzt,ajaxRetStr);
	}

}



function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isNumber(FormName.crm_khxx_fwmj, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_fwmj2, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye, "����ǩԼ��"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye2, "����ǩԼ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_pdsj, "�ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_pdsj2, "�ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.ddrq, "������ͬ���� "))) {
		return false;
	}
	if(!(isDatetime(FormName.ddrq2, "������ͬ���� "))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_khxx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_lrsj2, "¼��ʱ��"))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_khxx_kgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq2, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq2, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjgrq, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjgrq2, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq, "ʵ���������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq2, "ʵ���������"))) {
		return false;
	}
	if(!(isNumber(FormName.yqts, "��������"))) {
		return false;
	}
	if(!(isNumber(FormName.yqts2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.fkrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.fkrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxkssj, "���޿�ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxkssj2, "���޿�ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxjzsj, "���޽�ֹʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxjzsj2, "���޽�ֹʱ��"))) {
		return false;
	}

	FormName.action="Crm_khxxCxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
