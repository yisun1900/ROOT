<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}




	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	String jyjdrq=null;
	jyjdrq=request.getParameter("jyjdrq");
	if (jyjdrq!=null)
	{
		if (!(jyjdrq.equals("")))	wheresql+="  and (jyjdrq>=TO_DATE('"+jyjdrq+"','YYYY/MM/DD'))";
	}
	jyjdrq=request.getParameter("jyjdrq2");
	if (jyjdrq!=null)
	{
		if (!(jyjdrq.equals("")))	wheresql+="  and (jyjdrq<=TO_DATE('"+jyjdrq+"','YYYY/MM/DD'))";
	}
	String kgrq=null;
	kgrq=request.getParameter("kgrq");
	if (kgrq!=null)
	{
		kgrq=kgrq.trim();
		if (!(kgrq.equals("")))	wheresql+="  and (kgrq>=TO_DATE('"+kgrq+"','YYYY/MM/DD'))";
	}
	kgrq=request.getParameter("kgrq2");
	if (kgrq!=null)
	{
		kgrq=kgrq.trim();
		if (!(kgrq.equals("")))	wheresql+="  and (kgrq<=TO_DATE('"+kgrq+"','YYYY/MM/DD'))";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	String pgjsj=null;
	pgjsj=request.getParameter("pgjsj");
	if (pgjsj!=null)
	{
		pgjsj=pgjsj.trim();
		if (!(pgjsj.equals("")))	wheresql+="  and (crm_khxx.pgjsj>=TO_DATE('"+pgjsj+"','YYYY/MM/DD'))";
	}
	pgjsj=request.getParameter("pgjsj2");
	if (pgjsj!=null)
	{
		pgjsj=pgjsj.trim();
		if (!(pgjsj.equals("")))	wheresql+="  and (crm_khxx.pgjsj<=TO_DATE('"+pgjsj+"','YYYY/MM/DD'))";
	}

	String htshbz=null;
	htshbz=request.getParameter("htshbz");
	if (htshbz!=null)
	{
		if (!(htshbz.equals("")))	wheresql+=" and  (crm_khxx.htshbz!='"+htshbz+"')";
	}



	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}

	ls_sql="SELECT crm_khxx.khbh khbh,crm_khxx.hth,sgdmc,gj,pgjsj,dd,DECODE(pdclzt,'1','�����ɵ�','2','�˹��ɵ�','5','�����ɵ�','6','��Ȩ�ɵ�','7','�ܵ�','8','��ʩ����','4','�����޸��ɵ�') pdclzt,DECODE(kgsjqd,'Y','��ȷ��','N','<font color=\"#FF00FF\">δȷ��</font>') kgsjqd,khxm,fwdz,crm_khxx.qye,khlxmc,dwmc";
	ls_sql+=" ,hdlxmc,jyjdrq,crm_khxx.sjs,crm_khxx.qyrq,crm_khxx.kgrq";
	ls_sql+=" FROM crm_khxx,sq_sgd,sq_dwxx,dm_khlxbm,dm_hdlxbm  ";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+) ";
    ls_sql+=" and crm_khxx.hdbz=dm_hdlxbm.hdlxbm(+) ";
    ls_sql+=" and crm_khxx.gcjdbm!='5' and crm_khxx.zt='2'";
    ls_sql+=" and crm_khxx.gj is not null ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=ordersql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("Crm_khxxCxList.jsp","","","");
//	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName1={"hth","khxm","fwdz","sjs","sgdmc","gj","pgjsj","dd","pdclzt","kgsjqd","jyjdrq","khlxmc","hdlxmc","dwmc","kgrq"};
	pageObj.setDisColName(disColName1);


//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	//pageObj.setEditStr("�޸�");
	

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	
	curPage=Integer.parseInt(pageStr);
}

%>

<CENTER ><B>�ɹܼ�--��ѯ</B></CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">��ͬ��</td>
	<td  width="6%">����</td>
	<td  width="15%">���ݵ�ַ</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">�ܼ�</td>
	<td  width="6%">�ɹܼ�ʱ��</td>
	<td  width="5%">����</td>
	<td  width="7%">�ɵ�״̬</td>
	<td  width="4%">����ʱ��</td>
	<td  width="6%">��������</td>
	<td  width="7%">�ͻ�����</td>
	<td  width="7%">�ص���־</td>
	<td  width="10%">ǩԼ����</td>
	<td  width="6%">Ӧ��������</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>