<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ�����ɵ�ͳ��</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="6%">ʩ����</td>
    <td  width="7%">������</td>
    <td  width="7%">�ʱ���</td>
    <td  width="8%">δ����������</td>
    <td  width="12%">δ����ʩ����</td>
    <td  width="8%">��ʩ������</td>
    <td  width="12%">��ʩ���ܶ�</td>
    <td  width="10%">��ʩ��ƽ������</td>
    <td  width="8%">�������깤��</td>
    <td  width="12%">�������깤�ܶ�</td>
    <td  width="10%">�������깤ƽ������</td>

  </tr>
  <%	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql=" SELECT sgd,sgdmc,bzs,zbj,sum(wkgsl) wkgsl,sum(wkgqye) wkgqye,sum(wwgsl) sl,sum(wwgqye) wwgqye,TO_CHAR(sum(wwgpjde)) wwgpjde,sum(wgsl) wgsl,sum(wgqye) wgqye,TO_CHAR(sum(wgpjde)) wgpjde";
	ls_sql+=" from";
	ls_sql+=" (";

	//δ����������
	ls_sql+=" SELECT crm_khxx.sgd,sgdmc,bzs,zbj,count(*) wkgsl,sum(qye) wkgqye,0 wwgsl,sum(qye) wwgqye,ROUND(sum(qye)/count(*),0) wwgpjde,0 wgsl,0 wgqye,0 wgpjde";
	ls_sql+=" FROM sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd and sq_sgd.cxbz='N'";
	ls_sql+=" and sq_sgd.ssfgs='"+ssfgs+"' and gcjdbm='1'";
	ls_sql+=" group by crm_khxx.sgd,sgdmc,bzs,zbj";

	ls_sql+=" union";

	//��ʩ������
	ls_sql+=" SELECT crm_khxx.sgd,sgdmc,bzs,zbj,0 wkgsl,0 wkgqye,count(*) wwgsl,sum(qye) wwgqye,ROUND(sum(qye)/count(*),0) wwgpjde,0 wgsl,0 wgqye,0 wgpjde";
	ls_sql+=" FROM sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd and sq_sgd.cxbz='N'";
	ls_sql+=" and sq_sgd.ssfgs='"+ssfgs+"' and gcjdbm not in('1','5')";
	ls_sql+=" group by crm_khxx.sgd,sgdmc,bzs,zbj";

	ls_sql+=" union";

	//�������깤��
	ls_sql+=" SELECT crm_khxx.sgd,sgdmc,bzs,zbj,0 wkgsl,0 wkgqye,0 wwgsl,0 wwgqye,0 wwgpjde,count(*) wgsl,sum(qye) wgqye,ROUND(sum(qye)/count(*),0) wgpjde";
	ls_sql+=" FROM sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd and sq_sgd.cxbz='N'";
	ls_sql+=" and sq_sgd.ssfgs='"+ssfgs+"' and gcjdbm='5'";
	ls_sql+=" and pdsj>=TO_DATE('"+cf.firstOfYear()+"','YYYY-MM-DD') and pdsj<=SYSDATE";
	ls_sql+=" group by crm_khxx.sgd,sgdmc,bzs,zbj";

	ls_sql+=" union";

	//�޹���ʩ����
	ls_sql+=" SELECT sgd,sgdmc,bzs,zbj,0 wkgsl,0 wkgqye,0 sl,0,0,0,0,0";
	ls_sql+=" FROM sq_sgd";
	ls_sql+=" where sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.cxbz='N' ";

	ls_sql+=" )";
	ls_sql+=" group by sgd,sgdmc,bzs,zbj";

	ls_sql+=" order by sl desc";
//	out.println(ls_sql);
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
//������ʾ��
	String[] disColName1={"sgdmc","bzs","zbj","wkgsl","wkgqye","sl","wwgqye","wwgpjde","wgsl","wgqye","wgpjde"};
	pageObj.setDisColName(disColName1);
/*
*/

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sgd"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewPdTjb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sgdmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("kp_sgdkpjg_bqpm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>
</body>
</html>