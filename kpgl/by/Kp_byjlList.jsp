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
	String kp_byjl_byjlh=null;
	String kp_byjl_khbh=null;
	String kp_byjl_khxm=null;
	String kp_byjl_fwdz=null;
	String kp_byjl_lxfs=null;
	String kp_byjl_sjs=null;
	String kp_byjl_sgd=null;
	String kp_byjl_zjy=null;
	String kp_byjl_jgrq=null;
	String kp_byjl_hth=null;
	String kp_byjl_slsj=null;
	String kp_byjl_slr=null;
	String kp_byjl_bydxlxbm=null;
	String kp_byjl_bylxbm=null;
	String kp_byjl_bynr=null;
	kp_byjl_byjlh=request.getParameter("kp_byjl_byjlh");
	if (kp_byjl_byjlh!=null)
	{
		kp_byjl_byjlh=cf.GB2Uni(kp_byjl_byjlh);
		if (!(kp_byjl_byjlh.equals("")))	wheresql+=" and  (kp_byjl.byjlh='"+kp_byjl_byjlh+"')";
	}
	kp_byjl_khbh=request.getParameter("kp_byjl_khbh");
	if (kp_byjl_khbh!=null)
	{
		kp_byjl_khbh=cf.GB2Uni(kp_byjl_khbh);
		if (!(kp_byjl_khbh.equals("")))	wheresql+=" and  (kp_byjl.khbh='"+kp_byjl_khbh+"')";
	}
	kp_byjl_khxm=request.getParameter("kp_byjl_khxm");
	if (kp_byjl_khxm!=null)
	{
		kp_byjl_khxm=cf.GB2Uni(kp_byjl_khxm);
		if (!(kp_byjl_khxm.equals("")))	wheresql+=" and  (kp_byjl.khxm='"+kp_byjl_khxm+"')";
	}
	kp_byjl_fwdz=request.getParameter("kp_byjl_fwdz");
	if (kp_byjl_fwdz!=null)
	{
		kp_byjl_fwdz=cf.GB2Uni(kp_byjl_fwdz);
		if (!(kp_byjl_fwdz.equals("")))	wheresql+=" and  (kp_byjl.fwdz='"+kp_byjl_fwdz+"')";
	}
	kp_byjl_lxfs=request.getParameter("kp_byjl_lxfs");
	if (kp_byjl_lxfs!=null)
	{
		kp_byjl_lxfs=cf.GB2Uni(kp_byjl_lxfs);
		if (!(kp_byjl_lxfs.equals("")))	wheresql+=" and  (kp_byjl.lxfs='"+kp_byjl_lxfs+"')";
	}
	kp_byjl_sjs=request.getParameter("kp_byjl_sjs");
	if (kp_byjl_sjs!=null)
	{
		kp_byjl_sjs=cf.GB2Uni(kp_byjl_sjs);
		if (!(kp_byjl_sjs.equals("")))	wheresql+=" and  (kp_byjl.sjs='"+kp_byjl_sjs+"')";
	}
	kp_byjl_sgd=request.getParameter("kp_byjl_sgd");
	if (kp_byjl_sgd!=null)
	{
		kp_byjl_sgd=cf.GB2Uni(kp_byjl_sgd);
		if (!(kp_byjl_sgd.equals("")))	wheresql+=" and  (kp_byjl.sgd='"+kp_byjl_sgd+"')";
	}
	kp_byjl_zjy=request.getParameter("kp_byjl_zjy");
	if (kp_byjl_zjy!=null)
	{
		kp_byjl_zjy=cf.GB2Uni(kp_byjl_zjy);
		if (!(kp_byjl_zjy.equals("")))	wheresql+=" and  (kp_byjl.zjy='"+kp_byjl_zjy+"')";
	}
	kp_byjl_jgrq=request.getParameter("kp_byjl_jgrq");
	if (kp_byjl_jgrq!=null)
	{
		kp_byjl_jgrq=kp_byjl_jgrq.trim();
		if (!(kp_byjl_jgrq.equals("")))	wheresql+="  and (kp_byjl.jgrq=TO_DATE('"+kp_byjl_jgrq+"','YYYY/MM/DD'))";
	}
	kp_byjl_hth=request.getParameter("kp_byjl_hth");
	if (kp_byjl_hth!=null)
	{
		kp_byjl_hth=cf.GB2Uni(kp_byjl_hth);
		if (!(kp_byjl_hth.equals("")))	wheresql+=" and  (kp_byjl.hth='"+kp_byjl_hth+"')";
	}
	kp_byjl_slsj=request.getParameter("kp_byjl_slsj");
	if (kp_byjl_slsj!=null)
	{
		kp_byjl_slsj=kp_byjl_slsj.trim();
		if (!(kp_byjl_slsj.equals("")))	wheresql+="  and (kp_byjl.slsj=TO_DATE('"+kp_byjl_slsj+"','YYYY/MM/DD'))";
	}
	kp_byjl_slr=request.getParameter("kp_byjl_slr");
	if (kp_byjl_slr!=null)
	{
		kp_byjl_slr=cf.GB2Uni(kp_byjl_slr);
		if (!(kp_byjl_slr.equals("")))	wheresql+=" and  (kp_byjl.slr='"+kp_byjl_slr+"')";
	}
	kp_byjl_bydxlxbm=request.getParameter("kp_byjl_bydxlxbm");
	if (kp_byjl_bydxlxbm!=null)
	{
		kp_byjl_bydxlxbm=cf.GB2Uni(kp_byjl_bydxlxbm);
		if (!(kp_byjl_bydxlxbm.equals("")))	wheresql+=" and  (kp_byjl.bydxlxbm='"+kp_byjl_bydxlxbm+"')";
	}
	kp_byjl_bylxbm=request.getParameter("kp_byjl_bylxbm");
	if (kp_byjl_bylxbm!=null)
	{
		kp_byjl_bylxbm=cf.GB2Uni(kp_byjl_bylxbm);
		if (!(kp_byjl_bylxbm.equals("")))	wheresql+=" and  (kp_byjl.bylxbm='"+kp_byjl_bylxbm+"')";
	}
	kp_byjl_bynr=request.getParameter("kp_byjl_bynr");
	if (kp_byjl_bynr!=null)
	{
		kp_byjl_bynr=cf.GB2Uni(kp_byjl_bynr);
		if (!(kp_byjl_bynr.equals("")))	wheresql+=" and  (kp_byjl.bynr='"+kp_byjl_bynr+"')";
	}
	ls_sql="SELECT kp_byjl.byjlh,kp_byjl.khxm,kp_byjl.fwdz,kp_byjl.lxfs,kp_byjl.sjs,sgdmc,kp_byjl.zjy,kp_byjl.jgrq,kp_byjl.slsj,kp_byjl.slr, DECODE(kp_byjl.bydxlxbm,'1','ʩ����','2','���ʦ','3','�ʼ�Ա'), DECODE(kp_byjl.bylxbm,'01','ý��','02','�ż�','03','���'),kp_byjl.bynr  ";
	ls_sql+=" FROM kp_byjl,sq_sgd  ";
    ls_sql+=" where kp_byjl.sgd=sq_sgd.sgd";
    ls_sql+=wheresql;
	ls_sql+=" order by slsj desc ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_byjlList.jsp","SelectKp_byjl.jsp","","EditKp_byjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"byjlh","kp_byjl_khbh","kp_byjl_khxm","kp_byjl_fwdz","kp_byjl_lxfs","kp_byjl_sjs","sq_dwxx_dwmc","kp_byjl_zjy","kp_byjl_jgrq","kp_byjl_hth","kp_byjl_slsj","kp_byjl_slr","kp_byjl_bydxlxbm","kp_byjl_bylxbm","kp_byjl_bynr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"byjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Kp_byjlList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] byjlh = request.getParameterValues("byjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(byjlh,"byjlh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from kp_byjl where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="5%">�����¼��</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="17%">���ݵ�ַ</td>
	<td  width="7%">��ϵ��ʽ</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">�ʼ�Ա</td>
	<td  width="5%">��������</td>
	<td  width="5%">����ʱ��</td>
	<td  width="5%">������</td>
	<td  width="5%">�������</td>
	<td  width="5%">��������</td>
	<td  width="18%">��������</td>
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