<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String khbh=null;
	String khxm=null;
	String cqbm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String sjs=null;


	String pdclzt=null;
	String lrsj=null;
	String newsgd=null;
	String oldsgd=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}
	cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		cqbm=cf.GB2Uni(cqbm);
		if (!(cqbm.equals("")))	wheresql+=" and  (crm_khxx.cqbm='"+cqbm+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	pdclzt=request.getParameter("pdclzt");
	if (pdclzt!=null)
	{
		pdclzt=cf.GB2Uni(pdclzt);
		if (!(pdclzt.equals("")))	wheresql+=" and  (crm_khxx.pdclzt='"+pdclzt+"')";
	}



	newsgd=request.getParameter("newsgd");
	if (newsgd!=null)
	{
		newsgd=cf.GB2Uni(newsgd);
		if (!(newsgd.equals("")))	wheresql+=" and  (pd_hsgdjl.newsgd='"+newsgd+"')";
	}
	oldsgd=request.getParameter("oldsgd");
	if (oldsgd!=null)
	{
		oldsgd=cf.GB2Uni(oldsgd);
		if (!(oldsgd.equals("")))	wheresql+=" and  (pd_hsgdjl.oldsgd='"+oldsgd+"')";
	}

	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (pd_hsgdjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (pd_hsgdjl.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_khxx.khbh,hth,DECODE(pdclzt,'1','�����ɵ�','2','�˹��ɵ�','5','�����ɵ�','6','��Ȩ�ɵ�','7','�ܵ�','8','��ʩ����','4','�����޸��ɵ�') pdclzt,DECODE(kgsjqd,'Y','��ȷ��','N','<font color=\"#FF00FF\">δȷ��</font>') kgsjqd";
	ls_sql+=" ,pd_hsgdjl.newsgd,a.sgdmc newsgdmc,b.sgdmc oldsgdmc,pd_hsgdjl.newsgbz,pd_hsgdjl.oldsgbz,pd_hsgdjl.oldkzbbfb||'%' oldkzbbfb,pd_hsgdjl.newkzbbfb||'%' newkzbbfb,crm_khxx.zjxm";
	ls_sql+=" ,DECODE(crm_khxx.jlbz,'0','�˹��ɵ�','1','�ص�����','2','��˾����','3','���ʦָ���ɵ�','4','�ͻ�ָ���ɵ�','5','�󵥵�С��','6','С���ִ�','7','�������','8','�����ɵ�','9','ͬС���ɵ�') jlbz";
	ls_sql+=" ,pd_hsgdjl.hsgdyy,pd_hsgdjl.lrsj,pd_hsgdjl.lrr,jyjdrq";
	ls_sql+=" ,DECODE(hdbz,'1','�ǻص�','2','���ʦ�ص�','3','ʩ���ӻص�','4','�Ͽͻ��ص�','5','Ա���ص�','6','�೤�ص�','7','��¥��','8','������','9','����') hdbz,khxm,fwdz,sjs,sq_dwxx.dwmc sqdm";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd a,sq_sgd b,pd_hsgdjl ";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
    ls_sql+=" and pd_hsgdjl.newsgd=a.sgd(+) and pd_hsgdjl.oldsgd=b.sgd(+) ";
    ls_sql+=" and crm_khxx.gcjdbm!='5' ";//1�������ɵ���2���˹��ɵ���5�������ɵ���6����Ȩ�ɵ���7���ܵ���8����ʩ���ӣ�4�������޸��ɵ�
	ls_sql+=" and crm_khxx.khbh=pd_hsgdjl.khbh and crm_khxx.sgd=pd_hsgdjl.newsgd";
	ls_sql+=wheresql;
    ls_sql+=" order by pd_hsgdjl.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_khxxScList.jsp","SelectScCrm_khxx.jsp","","");
	pageObj.setPageRow(15);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"hth","khxm","pdclzt","oldsgdmc","oldsgbz","newsgdmc","newsgbz","oldkzbbfb","newkzbbfb","zjxm","jlbz","lrsj","lrr","hsgdyy","kgsjqd","jyjdrq","hdbz","fwdz","sjs","sqdm"};
	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"khbh","newsgd"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ����ʩ������Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeletePd_hsgdjl.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
/*
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ɾ��--��ʩ������Ϣ��ע�⣺����᲻�����޸ģ� </font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">��ͬ��</td>
	<td  width="4%">����</td>
	<td  width="4%">�ɵ�״̬</td>
	<td  width="3%">ԭʩ����</td>
	<td  width="3%">ԭʩ���೤</td>
	<td  width="3%">��ʩ����</td>
	<td  width="3%">��ʩ���೤</td>
	<td  width="3%">��ԭʩ�����ɵ�ָ��ٷֱ�</td>
	<td  width="3%">����ʩ�����ɵ�ָ��ٷֱ�</td>
	<td  width="3%">�ʼ�</td>
	<td  width="5%">�ɵ�����</td>
	<td  width="5%">��ʩ����ʱ��</td>
	<td  width="3%">������</td>
	<td  width="17%">��ʩ����ԭ��</td>
	<td  width="3%">����ʱ��</td>
	<td  width="5%">��������</td>
	<td  width="4%">�ص���־</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="4%">���ʦ</td>
	<td  width="7%">ǩԼ����</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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