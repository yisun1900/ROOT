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
	String kp_xjgdjh_jhbh=null;
	String kp_xjgdjh_khbh=null;
	String kp_xjgdjh_xjr=null;
	String kp_xjgdjh_jhxjsj=null;
	String kp_xjgdjh_xjlx=null;
	String kp_xjgdjh_lrr=null;
	String kp_xjgdjh_lrsj=null;
	String kp_xjgdjh_wcbz=null;
	String kp_xjgdjh_wwcyybm=null;
	String kdm_wwcyybm_wwcyy=null;
	String kp_xjgdjh_shbz=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_sgbz=null;
	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";

	kp_xjgdjh_jhbh=request.getParameter("kp_xjgdjh_jhbh");
	if (kp_xjgdjh_jhbh!=null)
	{
		kp_xjgdjh_jhbh=cf.GB2Uni(kp_xjgdjh_jhbh);
		if (!(kp_xjgdjh_jhbh.equals("")))	wheresql+=" and  (kp_xjgdjh.jhbh='"+kp_xjgdjh_jhbh+"')";
	}
	kp_xjgdjh_khbh=request.getParameter("kp_xjgdjh_khbh");
	if (kp_xjgdjh_khbh!=null)
	{
		kp_xjgdjh_khbh=cf.GB2Uni(kp_xjgdjh_khbh);
		if (!(kp_xjgdjh_khbh.equals("")))	wheresql+=" and  (kp_xjgdjh.khbh='"+kp_xjgdjh_khbh+"')";
	}
	kp_xjgdjh_xjr=request.getParameter("kp_xjgdjh_xjr");
	if (kp_xjgdjh_xjr!=null)
	{
		kp_xjgdjh_xjr=cf.GB2Uni(kp_xjgdjh_xjr);
		if (!(kp_xjgdjh_xjr.equals("")))	wheresql+=" and  (kp_xjgdjh.xjr='"+kp_xjgdjh_xjr+"')";
	}
	kp_xjgdjh_jhxjsj=request.getParameter("kp_xjgdjh_jhxjsj");
	if (kp_xjgdjh_jhxjsj!=null)
	{
		kp_xjgdjh_jhxjsj=kp_xjgdjh_jhxjsj.trim();
		if (!(kp_xjgdjh_jhxjsj.equals("")))	wheresql+="  and (kp_xjgdjh.jhxjsj>=TO_DATE('"+kp_xjgdjh_jhxjsj+"','YYYY/MM/DD'))";
	}
	kp_xjgdjh_jhxjsj=request.getParameter("kp_xjgdjh_jhxjsj2");
	if (kp_xjgdjh_jhxjsj!=null)
	{
		kp_xjgdjh_jhxjsj=kp_xjgdjh_jhxjsj.trim();
		if (!(kp_xjgdjh_jhxjsj.equals("")))	wheresql+="  and (kp_xjgdjh.jhxjsj<=TO_DATE('"+kp_xjgdjh_jhxjsj+"','YYYY/MM/DD'))";
	}
	kp_xjgdjh_xjlx=request.getParameter("kp_xjgdjh_xjlx");
	if (kp_xjgdjh_xjlx!=null)
	{
		kp_xjgdjh_xjlx=cf.GB2Uni(kp_xjgdjh_xjlx);
		if (!(kp_xjgdjh_xjlx.equals("")))	wheresql+=" and  (kp_xjgdjh.xjlx='"+kp_xjgdjh_xjlx+"')";
	}
	kp_xjgdjh_lrr=request.getParameter("kp_xjgdjh_lrr");
	if (kp_xjgdjh_lrr!=null)
	{
		kp_xjgdjh_lrr=cf.GB2Uni(kp_xjgdjh_lrr);
		if (!(kp_xjgdjh_lrr.equals("")))	wheresql+=" and  (kp_xjgdjh.lrr='"+kp_xjgdjh_lrr+"')";
	}
	kp_xjgdjh_lrsj=request.getParameter("kp_xjgdjh_lrsj");
	if (kp_xjgdjh_lrsj!=null)
	{
		kp_xjgdjh_lrsj=kp_xjgdjh_lrsj.trim();
		if (!(kp_xjgdjh_lrsj.equals("")))	wheresql+="  and (kp_xjgdjh.lrsj=TO_DATE('"+kp_xjgdjh_lrsj+"','YYYY/MM/DD'))";
	}
	kp_xjgdjh_wcbz=request.getParameter("kp_xjgdjh_wcbz");
	if (kp_xjgdjh_wcbz!=null)
	{
		kp_xjgdjh_wcbz=cf.GB2Uni(kp_xjgdjh_wcbz);
		if (!(kp_xjgdjh_wcbz.equals("")))	wheresql+=" and  (kp_xjgdjh.wcbz='"+kp_xjgdjh_wcbz+"')";
	}
	kp_xjgdjh_wwcyybm=request.getParameter("kp_xjgdjh_wwcyybm");
	if (kp_xjgdjh_wwcyybm!=null)
	{
		kp_xjgdjh_wwcyybm=cf.GB2Uni(kp_xjgdjh_wwcyybm);
		if (!(kp_xjgdjh_wwcyybm.equals("")))	wheresql+=" and  (kp_xjgdjh.wwcyybm='"+kp_xjgdjh_wwcyybm+"')";
	}
	kdm_wwcyybm_wwcyy=request.getParameter("kdm_wwcyybm_wwcyy");
	if (kdm_wwcyybm_wwcyy!=null)
	{
		kdm_wwcyybm_wwcyy=cf.GB2Uni(kdm_wwcyybm_wwcyy);
		if (!(kdm_wwcyybm_wwcyy.equals("")))	wheresql+=" and  (kdm_wwcyybm.wwcyy='"+kdm_wwcyybm_wwcyy+"')";
	}
	kp_xjgdjh_shbz=request.getParameter("kp_xjgdjh_shbz");
	if (kp_xjgdjh_shbz!=null)
	{
		kp_xjgdjh_shbz=cf.GB2Uni(kp_xjgdjh_shbz);
		if (!(kp_xjgdjh_shbz.equals("")))	wheresql+=" and  (kp_xjgdjh.shbz='"+kp_xjgdjh_shbz+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_sgbz=request.getParameter("crm_khxx_sgbz");
	if (crm_khxx_sgbz!=null)
	{
		crm_khxx_sgbz=cf.GB2Uni(crm_khxx_sgbz);
		if (!(crm_khxx_sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+crm_khxx_sgbz+"')";
	}
	ls_sql="SELECT kp_xjgdjh.jhbh,kp_xjgdjh.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,a.dwmc dwbh,kp_xjgdjh.xjr,kp_xjgdjh.jhxjsj, DECODE(kp_xjgdjh.xjlx,'1','����Ѳ��','2','��ʱѲ��','9','����'),kp_xjgdjh.lrr,kp_xjgdjh.lrsj, DECODE(kp_xjgdjh.wcbz,'1','���üƻ�','2','��ɼƻ�','3','δ���')";
	ls_sql+=" FROM crm_khxx,kdm_wwcyybm,kp_xjgdjh,sq_dwxx a,sq_sgd ";
    ls_sql+=" where kp_xjgdjh.wwcyybm=kdm_wwcyybm.wwcyybm(+) and kp_xjgdjh.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.dwbh=a.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_xjgdjh.jhxjsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_xjgdjhList.jsp","SelectKp_xjgdjh.jsp","","EditKp_xjgdjh.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jhbh","kp_xjgdjh_khbh","kp_xjgdjh_xjr","kp_xjgdjh_jhxjsj","kp_xjgdjh_xjlx","kp_xjgdjh_lrr","kp_xjgdjh_lrsj","kp_xjgdjh_wcbz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_sjs","crm_khxx_dwbh","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jhbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Kp_xjgdjhList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"jhbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="ViewKp_xjgdjh.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jhbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] jhbh = request.getParameterValues("jhbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jhbh,"jhbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from kp_xjgdjh where "+chooseitem;
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="6%">�ƻ����</td>
	<td  width="6%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="17%">���ݵ�ַ</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">���̵���</td>
	<td  width="9%">ǩԼ����</td>
	<td  width="5%">Ѳ����</td>
	<td  width="7%">�ƻ�Ѳ��ʱ��</td>
	<td  width="6%">Ѳ������</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="6%">��ɱ�־</td>
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