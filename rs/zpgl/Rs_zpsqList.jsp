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
	String zpsqbh=null;
	String fgs=null;
	String sqbm=null;
	String zbzw=null;
	String zprs=null;
	String zpfy=null;
	String zbly=null;
	String zbqt=null;
	String xwdgsj=null;
	String xbyq=null;
	String hyyq=null;
	String nlyq=null;
	String xl=null;
	String zy=null;
	String wy=null;
	String jsjnl=null;
	String gzjy=null;
	String gx=null;
	String jn=null;
	String qt=null;
	String rygznr=null;
	String sqzt=null;
	String lrr=null;
	String lrsj=null;
	String ssfgs=null;
	zpsqbh=request.getParameter("zpsqbh");
	if (zpsqbh!=null)
	{
		zpsqbh=cf.GB2Uni(zpsqbh);
		if (!(zpsqbh.equals("")))	wheresql+=" and  (zpsqbh='"+zpsqbh+"')";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (rs_zpsq.fgs='"+fgs+"')";
	}
	sqbm=request.getParameter("sqbm");
	if (sqbm!=null)
	{
		sqbm=cf.GB2Uni(sqbm);
		if (!(sqbm.equals("")))	wheresql+=" and  (rs_zpsq.sqbm='"+sqbm+"')";
	}
	zbzw=request.getParameter("zbzw");
	if (zbzw!=null)
	{
		zbzw=cf.GB2Uni(zbzw);
		if (!(zbzw.equals("")))	wheresql+=" and  (rs_zpsq.zbzw='"+zbzw+"')";
	}
	zprs=request.getParameter("zprs");
	if (zprs!=null)
	{
		zprs=zprs.trim();
		if (!(zprs.equals("")))	wheresql+=" and (zprs="+zprs+") ";
	}
	zpfy=request.getParameter("zpfy");
	if (zpfy!=null)
	{
		zpfy=zpfy.trim();
		if (!(zpfy.equals("")))	wheresql+=" and  (zpfy="+zpfy+") ";
	}
	zbly=request.getParameter("zbly");
	if (zbly!=null)
	{
		zbly=cf.GB2Uni(zbly);
		if (!(zbly.equals("")))	wheresql+=" and  (zbly='"+zbly+"')";
	}
	zbqt=request.getParameter("zbqt");
	if (zbqt!=null)
	{
		zbqt=cf.GB2Uni(zbqt);
		if (!(zbqt.equals("")))	wheresql+=" and  (zbqt='"+zbqt+"')";
	}
	xwdgsj=request.getParameter("xwdgsj");
	if (xwdgsj!=null)
	{
		xwdgsj=xwdgsj.trim();
		if (!(xwdgsj.equals("")))	wheresql+="  and (xwdgsj>=TO_DATE('"+xwdgsj+"','YYYY/MM/DD'))";
	}
	xwdgsj=request.getParameter("xwdgsj2");
	if (xwdgsj!=null)
	{
		xwdgsj=xwdgsj.trim();
		if (!(xwdgsj.equals("")))	wheresql+="  and (xwdgsj<=TO_DATE('"+xwdgsj+"','YYYY/MM/DD'))";
	}
	xbyq=request.getParameter("xbyq");
	if (xbyq!=null)
	{
		xbyq=cf.GB2Uni(xbyq);
		if (!(xbyq.equals("")))	wheresql+=" and  (xbyq='"+xbyq+"')";
	}
	hyyq=request.getParameter("hyyq");
	if (hyyq!=null)
	{
		hyyq=cf.GB2Uni(hyyq);
		if (!(hyyq.equals("")))	wheresql+=" and  (hyyq='"+hyyq+"')";
	}
	nlyq=request.getParameter("nlyq");
	if (nlyq!=null)
	{
		nlyq=cf.GB2Uni(nlyq);
		if (!(nlyq.equals("")))	wheresql+=" and  (nlyq='"+nlyq+"')";
	}
	xl=request.getParameter("xl");
	if (xl!=null)
	{
		xl=cf.GB2Uni(xl);
		if (!(xl.equals("")))	wheresql+=" and  (xl='"+xl+"')";
	}
	zy=request.getParameter("zy");
	if (zy!=null)
	{
		zy=cf.GB2Uni(zy);
		if (!(zy.equals("")))	wheresql+=" and  (zy='"+zy+"')";
	}
	wy=request.getParameter("wy");
	if (wy!=null)
	{
		wy=cf.GB2Uni(wy);
		if (!(wy.equals("")))	wheresql+=" and  (wy='"+wy+"')";
	}
	jsjnl=request.getParameter("jsjnl");
	if (jsjnl!=null)
	{
		jsjnl=cf.GB2Uni(jsjnl);
		if (!(jsjnl.equals("")))	wheresql+=" and  (jsjnl='"+jsjnl+"')";
	}
	gzjy=request.getParameter("gzjy");
	if (gzjy!=null)
	{
		gzjy=cf.GB2Uni(gzjy);
		if (!(gzjy.equals("")))	wheresql+=" and  (gzjy='"+gzjy+"')";
	}
	gx=request.getParameter("gx");
	if (gx!=null)
	{
		gx=cf.GB2Uni(gx);
		if (!(gx.equals("")))	wheresql+=" and  (gx='"+gx+"')";
	}
	jn=request.getParameter("jn");
	if (jn!=null)
	{
		jn=cf.GB2Uni(jn);
		if (!(jn.equals("")))	wheresql+=" and  (rs_zpsq.jn='"+jn+"')";
	}
	qt=request.getParameter("qt");
	if (qt!=null)
	{
		qt=cf.GB2Uni(qt);
		if (!(qt.equals("")))	wheresql+=" and  (rs_zpsq.qt='"+qt+"')";
	}
	rygznr=request.getParameter("rygznr");
	if (rygznr!=null)
	{
		rygznr=cf.GB2Uni(rygznr);
		if (!(rygznr.equals("")))	wheresql+=" and  (rs_zpsq.rygznr='"+rygznr+"')";
	}
	sqzt=request.getParameter("sqzt");
	if (sqzt!=null)
	{
		sqzt=cf.GB2Uni(sqzt);
		if (!(sqzt.equals("")))	wheresql+=" and  (rs_zpsq.sqzt='"+sqzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (rs_zpsq.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_zpsqlrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_zpsq.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_zpsq.ssfgs='"+ssfgs+"')";
	}
	ls_sql="SELECT zpsqbh,a.dwmc fgs,b.dwmc sqbm,dm_xzzwbm.xzzwmc zbzw,zprs,zpfy, DECODE(zbly,'0','����','1','ȱԱ����','2','�������','3','��������'),zbqt,xwdgsj, DECODE(xbyq,'0','����','1','��','2','Ů'), DECODE(hyyq,'0','����','1','�ѻ�','2','δ��'),nlyq, DECODE(xl,'0','����','1','��ר','2','��ѧ','3','˶ʿ'),zy,wy,jsjnl,gzjy,gx,jn,qt,rygznr, DECODE(rs_zpsq.sqzt,'01','�ȴ�����','02','��������','03','����ȡ��','04','��ʼ��Ƹ','05','��Ƹ����'),rs_ztbm.ztmc ztbm,lrr,lrsj,c.dwmc ssfgs,rs_zpsq.bz  ";
	ls_sql+=" FROM rs_zpsq,dm_xzzwbm,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm  ";
    ls_sql+=" where rs_zpsq.zbzw=dm_xzzwbm.xzzwbm and rs_zpsq.fgs=a.dwbh and rs_zpsq.sqbm=b.dwbh and rs_zpsq.ssfgs=c.dwbh and rs_ztbm.ztbm=rs_zpsq.ztbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_zpsqList.jsp","SelectRs_zpsq.jsp","","EditRs_zpsq.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zpsqbh","fgs","sqbm","zbzw","zprs","zpfy","zbly","zbqt","xwdgsj","xbyq","hyyq","nlyq","xl","zy","wy","jsjnl","gzjy","gx","jn","qt","rygznr","sqzt","ztbm","lrr","lrsj","ssfgs","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zpsqbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_zpsqList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] zpsqbh = request.getParameterValues("zpsqbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zpsqbh,"zpsqbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from rs_zpsq where "+chooseitem;
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
	pageObj.printPageLink(240);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="3%">������</td>
	<td  width="3%">���빫˾</td>
	<td  width="3%">���벿��</td>
	<td  width="3%">����ְ��</td>
	<td  width="3%">����Ա��</td>
	<td  width="3%">��Ƹ����</td>
	<td  width="3%">��������</td>
	<td  width="3%">��������</td>
	<td  width="3%">ϣ������ʱ��</td>
	<td  width="3%">�Ա�</td>
	<td  width="3%">����</td>
	<td  width="3%">����Ҫ��</td>
	<td  width="3%">ѧ��Ҫ��</td>
	<td  width="3%">רҵҪ��</td>
	<td  width="3%">��������</td>
	<td  width="3%">���������</td>
	<td  width="3%">��������Ҫ��</td>
	<td  width="3%">����Ҫ��</td>
	<td  width="3%">����Ҫ��</td>
	<td  width="3%">����Ҫ��</td>
	<td  width="3%">����ְ��</td>
	<td  width="3%">����״̬</td>
	<td  width="3%">����״̬</td>
	<td  width="3%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="3%">¼���˷ֹ�˾</td>
	<td  width="11%">��ע</td>
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